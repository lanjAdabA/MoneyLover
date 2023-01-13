part of 'fetchrecentdata_cubit.dart';

class FetchrecentdataState extends Equatable {
  const FetchrecentdataState({
    required this.categoryid,
    required this.transactionid,
    required this.transaction2,
    required this.cateogoryname2,
    required this.transaction,
    required this.categoryname,
  });

  final List transaction;
  final List categoryname;
  final List transaction2;
  final List cateogoryname2;
  final List categoryid;
  final List transactionid;

  @override
  List get props => [transaction, categoryname];
}
