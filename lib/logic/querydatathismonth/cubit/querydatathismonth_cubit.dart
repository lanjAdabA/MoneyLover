// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:moneylover/services/serviceapi.dart';
import "package:collection/collection.dart";
part 'querydatathismonth_state.dart';

class QuerydatathismonthCubit extends Cubit<QuerydatathismonthState> {
  QuerydatathismonthCubit()
      : super(const QuerydatathismonthState(
            expensetotalamountthismonth: 0,
            incometotalamountthismonth: 0,
            categoryidlist: [],
            categoryname: [],
            datelist: [],
            grouptransaction: {},
            transaction: [])) {
    getthismonthquery();
  }
  Future getthismonthquery() async {
    DateTime dateTime = DateTime.now();
    // String date = dateTime.day.toString();
    int month = dateTime.month;
    int lastday = DateTime(dateTime.year, month, 0).day;
    String year = dateTime.year.toString();
    var start = DateTime.parse("$year-0${month.toString()}-01");
    var end =
        DateTime.parse("$year-0${month.toString()}-${lastday.toString()}");
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
      List categoryname = [];
      List transaction = [];

      List datelist = [];
      List categoryidlist = [];
      List transactionidlist = [];
      int totalamountexpensedthismonth = 0;
      int incomeamountthismonth = 0;

      for (var message in event.docs) {
        var data = await ServiceApi()
            .getspecificcategory(id: message.data()['category_id']);
        if (data['type'] == 'Expense') {
          totalamountexpensedthismonth =
              totalamountexpensedthismonth + message['amount'] as int;

          log('Expense');
        } else {
          incomeamountthismonth =
              incomeamountthismonth + message['amount'] as int;

          log('Income query');
        }
        transaction.add(message.data());
        categoryname.add(data['name']);
        transactionidlist.add(message.id);
        categoryidlist.add(message['category_id']);
      }

      int i;
      int j;
      for (j = 0; j < transaction.length; j++) {
        for (i = 0; i < transactionidlist.length; i++) {
          transaction[j]["transaction_id"] = transactionidlist[j];
          j++;
        }
      }

      log(transactionidlist.toString());

      var result = Map.fromIterables(categoryidlist, categoryname);
      log('this month${result.toString()}');
      for (Map element in transaction) {
        element.update('category_id', (value) => result[value]);
      }

      var grouptransaction = groupBy(transaction, ((m) {
        Timestamp date = m['date'];

        if (date.toDate().month.toString().length < 2 &&
            date.toDate().day.toString().length < 2) {
          String date2 =
              '${date.toDate().year}-0${date.toDate().month}-0${date.toDate().day}';
          return date2;
        } else if (date.toDate().month.toString().length < 2) {
          String date2 =
              '${date.toDate().year}-0${date.toDate().month}-${date.toDate().day}';
          return date2;
        } else if (date.toDate().day.toString().length < 2) {
          String date2 =
              '${date.toDate().year}-${date.toDate().month}-0${date.toDate().day}';
          return date2;
        } else {
          String date2 =
              '${date.toDate().year}-${date.toDate().month}-${date.toDate().day}';
          return date2;
        }
      }));
      log(grouptransaction.toString());

      grouptransaction.forEach((key, value) {
        datelist.add(key);
      });
      emit(QuerydatathismonthState(
        transaction: transaction,
        categoryname: categoryname,
        categoryidlist: categoryidlist,
        grouptransaction: grouptransaction,
        datelist: datelist,
        expensetotalamountthismonth: totalamountexpensedthismonth,
        incometotalamountthismonth: incomeamountthismonth,
      ));
    });
  }
}
