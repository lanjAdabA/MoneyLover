part of 'querydatathismonth_cubit.dart';

class QuerydatathismonthState extends Equatable {
  const QuerydatathismonthState({
    required this.transaction,
    required this.categoyname,
    required this.grouptransaction,
    required this.categoryidlist,
    required this.datelist,
    required this.expensetotalamountthismonth,
    required this.incometotalamountlastmonth,
  });

  final int expensetotalamountthismonth;
  final int incometotalamountlastmonth;
  final List transaction;
  final List categoyname;

  final Map<String, List<dynamic>> grouptransaction;
  final List categoryidlist;
  final List datelist;

  @override
  List get props => [expensetotalamountthismonth, incometotalamountlastmonth];
}
