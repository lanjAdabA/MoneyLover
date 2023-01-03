// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:moneylover/services/serviceapi.dart';

part 'fetchdata_state.dart';

class FetchdataCubit extends Cubit<FetchdataState> {
  FetchdataCubit()
      : super(const FetchdataState(
            amount: 0,
            categoryname: [],
            transaction: [],
            categorynameExp: [],
            transactionExp: [],
            expensetotalamount: 0,
            top3categoryname: [],
            top3transaction: [])) {
    getdatalist();
  }
  Future getqueryyear({required String year}) async {
    var start = DateTime.parse("$year-01-01");
    var end = DateTime.parse("$year-12-31");
    var finalstart = Timestamp.fromDate(start);
    var finalend = Timestamp.fromDate(end);

    FirebaseFirestore.instance
        .collection("expenditure")
        .where('date', isGreaterThan: finalstart)
        .where('date', isLessThan: finalend)
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future getdatalist() async {
    final CollectionReference expenditurelist =
        FirebaseFirestore.instance.collection('transaction');

    try {
      expenditurelist
          .orderBy('amount', descending: true)
          .snapshots()
          .listen((event) async {
        int totalamount = 0;
        int totalamountex = 0;
        List top3categoryname = [];
        List top3transaction = [];
        List<DocumentSnapshot<Object?>> categoryname = [];
        List<QueryDocumentSnapshot<Object?>> transaction = [];
        List<DocumentSnapshot<Object?>> categorynameEx = [];
        List<QueryDocumentSnapshot<Object?>> transactionEx = [];
        for (var message in event.docs) {
          transaction.add(message);
          var data = await ServiceApi()
              .getspecificcategory(id: message['category_id']);
          categoryname.add(data);

          categoryname.add(data);
          if (data['type'] == 'Income') {
            totalamount = totalamount + message['amount'] as int;

            log('Income');
          } else {
            totalamount = totalamount - message['amount'] as int;
            totalamountex = totalamountex + message['amount'] as int;

            categorynameEx.add(data);
            transactionEx.add(message);

            log('Expenditure');
            log(totalamount.toString());
          }
        }
        log(categoryname.toString());
        top3categoryname = categorynameEx.sublist(0, 3);
        top3transaction = transactionEx.sublist(0, 3);
        emit(FetchdataState(
            amount: totalamount,
            categoryname: categoryname,
            transaction: transaction,
            categorynameExp: categorynameEx,
            transactionExp: transactionEx,
            expensetotalamount: totalamountex,
            top3categoryname: top3categoryname,
            top3transaction: top3transaction));
      });
    } catch (e) {
      return null;
    }
  }
}
