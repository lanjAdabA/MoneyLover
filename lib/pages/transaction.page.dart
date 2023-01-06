// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneylover/logic/fetchdata/cubit/fetchdata_cubit.dart';
import 'package:moneylover/logic/fetchrecentdata/cubit/fetchrecentdata_cubit.dart';
import 'package:moneylover/logic/querydatathismonth/cubit/querydatathismonth_cubit.dart';

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

    int thismonthincome = thismonth.incometotalamountlastmonth;

    List<DocumentSnapshot<Object?>> cateogoryname = recent.categoyname;
    List transaction = recent.transaction;

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
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                        Color.fromARGB(255, 211, 209, 209)))),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Inflow"),
                                      Text(
                                        thismonthincome.toString(),
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Outflow"),
                                      Text(
                                        thismonthExpenditure.toString(),
                                        style:
                                            const TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    indent: 280,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [Text("remaining amount")],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 214, 247, 215),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "View report for this period",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cateogoryname.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.wallet,
                                              color: Colors.amber,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cateogoryname[index]['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text("Optional Description"),
                                          const SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    currencyformat
                                        .format(transaction[index]['amount']),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: cateogoryname[index]['name'] ==
                                                'Salary'
                                            ? Colors.blue
                                            : Colors.red),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
