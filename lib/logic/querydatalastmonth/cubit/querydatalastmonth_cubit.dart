// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:moneylover/services/serviceapi.dart';

part 'querydatalastmonth_state.dart';

class QuerydatalastmonthCubit extends Cubit<QuerydatalastmonthState> {
  QuerydatalastmonthCubit()
      : super(const QuerydatalastmonthState(expensetotalamountlastmonth: 0)) {
    getlastmonthquery();
  }

  Future getlastmonthquery() async {
    DateTime dateTime = DateTime.now();
    // String date = dateTime.day.toString();
    int month = dateTime.month;

    int lastday = DateTime(dateTime.year, month, 0).day;
    String year = dateTime.year.toString();
    var start = DateTime.parse("$year-0${(month - 1).toString()}-01");
    var end = DateTime.parse(
        "$year-0${(month - 1).toString()}-${lastday.toString()}");
    var finalstart = Timestamp.fromDate(start);
    var finalend = Timestamp.fromDate(end);

    log(start.toString());
    log(end.toString());

    FirebaseFirestore.instance
        .collection("transaction")
        .where('date', isGreaterThan: finalstart)
        .where('date', isLessThan: finalend)
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) async {
      int totalamountexLastmonth = 0;
      for (var message in event.docs) {
        var data =
            await ServiceApi().getspecificcategory(id: message['category_id']);
        if (data['type'] == 'Expense') {
          totalamountexLastmonth =
              totalamountexLastmonth + message['amount'] as int;
          emit(QuerydatalastmonthState(
            expensetotalamountlastmonth: totalamountexLastmonth,
          ));
          log('Income');
        } else {
          log('Income query');
        }
      }
    });
  }
}
