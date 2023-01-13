// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:moneylover/services/serviceapi.dart';

part 'fetchrecentdata_state.dart';

class FetchrecentdataCubit extends Cubit<FetchrecentdataState> {
  FetchrecentdataCubit()
      : super(const FetchrecentdataState(
            categoryname: [],
            transaction: [],
            cateogoryname2: [],
            transaction2: [],
            categoryid: [],
            transactionid: [])) {
    getdatalist();
  }

  Future getdatalist() async {
    final CollectionReference<Map<String, dynamic>> expenditurelist =
        FirebaseFirestore.instance.collection('transaction');

    try {
      expenditurelist
          .orderBy('date', descending: true)
          .snapshots()
          .listen((event) async {
        List transaction2 = [];
        List cateogoryname2 = [];
        List cateogoryname = [];
        List transaction = [];
        List categoryid = [];
        List transactionid = [];

        for (var message in event.docs) {
          transaction.add(message.data());
          var data = await ServiceApi()
              .getspecificcategory(id: message['category_id']);
          cateogoryname.add(data["name"]);
//!id
//*
//?
//todo
//
          categoryid.add(data.id);
          transactionid.add(message.id);
        }
        log("transactionlist${transaction.toString()}");
        transaction2 = transaction.sublist(0, 5);
        cateogoryname2 = cateogoryname.sublist(0, 5);

        emit(FetchrecentdataState(
            transaction: transaction,
            categoryname: cateogoryname,
            cateogoryname2: cateogoryname2,
            transaction2: transaction2,
            categoryid: categoryid,
            transactionid: transactionid));
      });
    } catch (e) {
      return null;
    }
  }
}
