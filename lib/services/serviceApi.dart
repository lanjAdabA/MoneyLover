// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceApi {
  final CollectionReference<Map<String, dynamic>> category =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference transaction =
      FirebaseFirestore.instance.collection('transaction');
  Future<void> addcategoryitem({
    required String name,
    required String type,
  }) async {
    return await category.doc().set({'name': name, 'type': type});
  }

  Future gettotalamount() async {
    List itemsList = [];

    try {
      final messages = await transaction.get();
      for (var message in messages.docs) {
        itemsList.add(message.data());
        // print(message.data());
      }

      return itemsList;
    } catch (e) {
      return null;
    }
  }

  //!
  Future addtransaction({
    required int amount,
    required String categoryid,
    required String notes,
    required Timestamp date,
  }) async {
    return await transaction.doc().set({
      'amount': amount,
      'category_id': categoryid,
      'date': date,
      'note': notes
    });
  }

  Future getdocumentid() async {
    List idlist = [];

    try {
      final messages = await category.get();
      for (var message in messages.docs) {
        idlist.add(message.id);
        log(message.id);
      }
      return idlist;
    } catch (e) {
      return null;
    }
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getspecificcategory({
    required String id,
  }) async {
    return await category.doc(id).get();
  }

  // Future deletecatagoryitem({
  //   required String id,
  // }) async {
  //   return await category.doc(id).delete();
  // }

  Future deleteexpenditureitem({
    required String id,
  }) async {
    return await transaction.doc(id).delete();
  }

  Future updatetransaction({
    required String id,
    required String categoryid,
    required int amount,
    required Timestamp date,
  }) async {
    return await transaction.doc(id).update({
      "amount": amount,
      "category_id": categoryid,
      "date": date,
    });
  }
}
