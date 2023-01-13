// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneylover/logic/fetchdata/cubit/fetchdata_cubit.dart';
import 'package:moneylover/logic/fetchrecentdata/cubit/fetchrecentdata_cubit.dart';
import 'package:moneylover/logic/querydatathismonth/cubit/querydatathismonth_cubit.dart';
import 'package:moneylover/widgets/tabbarviewblock.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

var currencyformat =
    NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

class _TransactionPageState extends State<TransactionPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final recent = context.watch<FetchrecentdataCubit>().state;
    final thismonth = context.watch<QuerydatathismonthCubit>().state;
    int thismonthExpenditure = thismonth.expensetotalamountthismonth;
    int thismonthincome = thismonth.incometotalamountthismonth;
    int remainingBalance = (thismonthincome - thismonthExpenditure);
    List cateogoryname = recent.categoryname;
    List transaction = recent.transaction;
    List categoryid = recent.categoryid;
    List transactionid = recent.transactionid;

    List datelistthismonth = thismonth.datelist;

    Map<String, List<dynamic>> grouptransactionthismonth =
        thismonth.grouptransaction;

    final s = context.watch<FetchdataCubit>().state;
    TabController tabController =
        TabController(initialIndex: 6, length: 8, vsync: this);

    int totalamount = s.amount;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Column(
                children: [
                  //!content
                  const Text(
                    "Balance",
                    style: TextStyle(color: Colors.grey),
                  ),
//

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        currencyformat.format(totalamount),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.search),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.more_vert_outlined),
                          SizedBox(
                            width: 8,
                          )
                        ],
                      )
                    ],
                  ),
                  //

                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child:
                        //! total grey btn
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      height: 38,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.blur_circular_outlined),
                          Text(
                            "Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  //! tabbar
                  TabBar(
                    labelStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    indicatorWeight: 2,
                    indicatorPadding: const EdgeInsets.all(1),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: "07/2022",
                      ),
                      Tab(
                        text: "08/2022",
                      ),
                      Tab(
                        text: "09/2022",
                      ),
                      Tab(
                        text: "10/2022",
                      ),
                      Tab(
                        text: "11/2022",
                      ),
                      Tab(
                        text: "Last month",
                      ),
                      Tab(
                        text: "This month",
                      ),
                      Tab(
                        text: "Future",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //! tabbarview
            SizedBox(
              width: double.maxFinite,
              height: 750,
              child: TabBarView(controller: tabController, children: [
                //1one
                const Center(
                  child: Text("one"),
                ),
                //2two
                const Center(
                  child: Text("two"),
                ),
                //3three
                const Center(
                  child: Text("three"),
                ),
                //4four
                const Center(
                  child: Text("four"),
                ),
                //5five
                const Center(
                  child: Text("five"),
                ),
                //6lastmonth
                const Center(
                  child: Text("six"),
                ),
                //7thismonth
                TabBarViewBlock(
                  thismonthincome: thismonthincome,
                  thismonthExpenditure: thismonthExpenditure,
                  remainingBalance: remainingBalance,
                  cateogoryname: cateogoryname,
                  grouptransaction: grouptransactionthismonth,
                  transaction: transaction,
                  datelist: datelistthismonth,
                  transactionid: transactionid, cateogoryid: categoryid,

                  // datelist: const [],
                ),
                //8future
                const Center(
                  child: Text("eight"),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
