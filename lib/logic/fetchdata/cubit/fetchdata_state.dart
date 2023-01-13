part of 'fetchdata_cubit.dart';

class FetchdataState extends Equatable {
  const FetchdataState(
      {required this.categoryid,
      required this.transactionid,
      required this.top3categoryname,
      required this.top3transaction,
      required this.expensetotalamount,
      required this.categorynameExp,
      required this.transactionExp,
      required this.transaction,
      required this.categoryname,
      required this.amount});

  final int amount;
  final int expensetotalamount;
  final List<QueryDocumentSnapshot<Object?>> transaction;
  final List<DocumentSnapshot<Object?>> categoryname;
  final List<DocumentSnapshot<Object?>> categorynameExp;
  final List<QueryDocumentSnapshot<Object?>> transactionExp;
  final List top3categoryname;
  final List top3transaction;
  final List categoryid;
  final List transactionid;

  @override
  List get props =>
      [amount, transaction, categoryname, categorynameExp, transactionExp];
}
