part of 'querydatathismonth_cubit.dart';

class QuerydatathismonthState extends Equatable {
  const QuerydatathismonthState({
    required this.transaction,
    required this.categoryname,
    required this.grouptransaction,
    required this.categoryidlist,
    required this.datelist,
    required this.expensetotalamountthismonth,
    required this.incometotalamountthismonth,
  });

  final int expensetotalamountthismonth;
  final int incometotalamountthismonth;
  final List transaction;
  final List categoryname;

  final Map<String, List<dynamic>> grouptransaction;
  final List categoryidlist;
  final List datelist;

  @override
  List get props => [expensetotalamountthismonth, incometotalamountthismonth];
}
