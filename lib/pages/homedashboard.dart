// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneylover/logic/fetchrecentdata/cubit/fetchrecentdata_cubit.dart';
import 'package:moneylover/logic/querydatalastmonth/cubit/querydatalastmonth_cubit.dart';
import 'package:moneylover/logic/querydatalastweek/cubit/querydatalastweek_cubit.dart';
import 'package:moneylover/logic/querydatathismonth/cubit/querydatathismonth_cubit.dart';
import 'package:moneylover/logic/querydatathisweek/cubit/querydatathisweek_cubit.dart';
import 'package:moneylover/pages/graph.page.dart';
import 'package:moneylover/router/router.gr.dart';
import '../logic/fetchdata/cubit/fetchdata_cubit.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage>
    with TickerProviderStateMixin {
  bool obscurePassword = true;
  void togglePasswordObscure() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  final CollectionReference transaction =
      FirebaseFirestore.instance.collection('transaction');
  var currencyformat =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    final recent = context.watch<FetchrecentdataCubit>().state;
    final s = context.watch<FetchdataCubit>().state;
    //!fetchdatacubit
    final thismonth = context.watch<QuerydatathismonthCubit>().state;
    final lastmonth = context.watch<QuerydatalastmonthCubit>().state;
    final thisweek = context.watch<QuerydatathisweekCubit>().state;
    final lastweek = context.watch<QuerydatalastweekCubit>().state;

    int thismonthExpenditure = thismonth.expensetotalamountthismonth;
    int lastmonthExpenditure = lastmonth.expensetotalamountlastmonth;
    int thisweekExpenditure = thisweek.expensetotalamountthisweek;
    int lastweekExpenditure = lastweek.expensetotalamountlastweek;
    log(lastmonthExpenditure.toString());

    List<DocumentSnapshot<Object?>> cateogoryname = recent.categoyname;
    List transaction = recent.transaction;

    List cateogorynameExp = s.top3categoryname;
    List transactionExp = s.top3transaction;
    int expensetotalamount = s.expensetotalamount;

    int totalamount = s.amount;
    TabController tabController =
        TabController(length: 2, vsync: this, animationDuration: Duration.zero);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child:
                    // amount n notificatn bell
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          obscurePassword
                              ? "*******"
                              : currencyformat.format(totalamount),
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: togglePasswordObscure,
                            child: Icon(obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ],
                    ),
                    const Icon(Icons.notifications_rounded)
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //total balance
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: const Icon(
                        Icons.question_mark,
                        size: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // my wallet n see all

                        GestureDetector(
                          onTap: () {
                            context.router.push(const MyWalletsRoute());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "My Wallets",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        //cash n amount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                context.router.push(const TransactionRoute());
                              },
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blueGrey[700]),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.wallet,
                                          color: Colors.amber,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Cash",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.router.push(const TransactionRoute());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  obscurePassword
                                      ? "*******"
                                      : currencyformat.format(totalamount),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //spending report n see report

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Spending report"),
                    Text(
                      "See reports",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  //tabbar

                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: 600,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300.0,
                          height: 43.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: const BubbleTabIndicator(
                                  indicatorRadius: 10,
                                  indicatorHeight: 36.0,
                                  indicatorColor: Colors.white,
                                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                ),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey[500],
                                controller: tabController,
                                automaticIndicatorColorAdjustment: true,
                                tabs: const [
                                  Tab(text: " Week"),
                                  Tab(text: "Month")
                                ]),
                          ),
                        ),

                        SizedBox(
                          width: double.maxFinite,
                          height: 250,
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: [
                                //*graph part
                                //!graph 1
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currencyformat
                                                .format(thisweekExpenditure),
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                          const Text(
                                            'Total spend this week',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    BargraphPage(
                                      thismonthamount: thisweekExpenditure,
                                      text1: 'Last Week',
                                      text2: 'This Week',
                                      lastmonthamount: lastweekExpenditure,
                                    ),
                                  ],
                                ),

                                //!graph 2
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currencyformat
                                                .format(thismonthExpenditure),
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                          const Text(
                                            'Total spend this month',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    BargraphPage(
                                      thismonthamount: thismonthExpenditure,
                                      text1: 'Last Month',
                                      text2: 'This Month',
                                      lastmonthamount: lastmonthExpenditure,
                                    ),
                                  ],
                                ),
                              ]),
                        ),

                        //!top spending(weekly/monthly top spending)

                        const Padding(
                          padding: EdgeInsets.only(left: 26, bottom: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Top Spending',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cateogorynameExp.length,
                          itemBuilder: ((context, index) {
                            double per = (transactionExp[index]['amount'] /
                                    expensetotalamount) *
                                100;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListTile(
                                leading: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: const [
                                    CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 43, 56, 96),
                                        radius: 12,
                                        child: Icon(
                                          Icons.wallet,
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 248, 135, 79),
                                        )),
                                  ],
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cateogorynameExp[index]['name'],
                                    ),
                                    Text(
                                      currencyformat.format(
                                          transactionExp[index]['amount']),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                                trailing: Text(
                                  '${per.toInt().toString()}%',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 120,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color.fromARGB(255, 240, 196, 64),
                            Color.fromARGB(255, 237, 160, 44),
                            Color.fromARGB(255, 237, 160, 44),
                            Color.fromARGB(255, 239, 62, 121),
                          ],
                        )),
                    child: const Center(
                      child: Text(
                        "Display ADS here!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ), //!recent transaction and see all
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recent transactions',
                    ),
                    Text('See all', style: TextStyle(color: Colors.green))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: transaction.length,
                              itemBuilder: ((context, index) {
                                Timestamp date = transaction[index]['date'];
                                var datetime = date.toDate();
                                var datefinal =
                                    DateFormat.yMMMd().format(datetime);

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ListTile(
                                    leading: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: const [
                                        CircleAvatar(
                                            backgroundColor:
                                                Color.fromARGB(255, 43, 56, 96),
                                            radius: 12,
                                            child: Icon(
                                              Icons.wallet,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 248, 135, 79),
                                            )),
                                      ],
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cateogoryname[index]['name'],
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          datefinal.toString(),
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    trailing: Text(
                                      currencyformat
                                          .format(transaction[index]['amount']),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: cateogoryname[index]['name'] ==
                                                  'Salary'
                                              ? Colors.blue
                                              : Colors.red),
                                    ),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "That's everything",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.switch_access_shortcut_add,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
