// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages, prefer_typing_uninitialized_variables
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:moneylover/pages/transaction.page.dart';
import 'package:moneylover/router/router.gr.dart';

class TabBarViewBlock extends StatelessWidget {
  final categoryidlist;

  TabBarViewBlock({
    Key? key,
    required this.thismonthincome,
    required this.transactionid,
    required this.thismonthExpenditure,
    required this.remainingBalance,
    required this.datelist,
    required this.grouptransaction,
    required this.cateogoryname,
    required this.transaction,
    this.categoryidlist,
    required this.cateogoryid,
  }) : super(key: key);

  final int thismonthincome;
  final int thismonthExpenditure;
  final int remainingBalance;

  final List datelist;

  final Map<String, List<dynamic>> grouptransaction;

  final List cateogoryname;

  final List transaction;
  final now = DateTime.now();

  //!id
  final List transactionid;
  final List cateogoryid;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 211, 209, 209)))),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Inflow"),
                          Text(
                            thismonthincome.toString(),
                            style: const TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Outflow"),
                          Text(
                            thismonthExpenditure.toString(),
                            style: const TextStyle(color: Colors.red),
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
                        children: [Text(remainingBalance.toString())],
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
                        fontWeight: FontWeight.bold, color: Colors.green),
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
                physics: const BouncingScrollPhysics(),
                itemCount: datelist.length,
                shrinkWrap: true,
                itemBuilder: ((context, indexdategroup) {
                  String date = datelist[indexdategroup];
                  DateTime checkingdate = DateTime.parse(date);
                  final aDate = DateTime(
                      checkingdate.year, checkingdate.month, checkingdate.day);

                  var datetime = DateTime.parse(date);
                  var monthyear = DateFormat.yMMMM().format(datetime);
                  var day = DateFormat('EEEE').format(datetime);
                  var dateonly = DateFormat.d().format(datetime);
                  final today = DateTime(now.year, now.month, now.day);
                  final yesterday = DateTime(now.year, now.month, now.day - 1);
                  final tomorrow = DateTime(now.year, now.month, now.day + 1);
                  if (aDate == today) {
                    day = 'Today';
                  } else if (aDate == yesterday) {
                    day = 'Yesterday';
                  } else if (aDate == tomorrow) {
                    day = 'Tomorrow';
                  } else {}
                  int totalamountthismonth =
                      thismonthincome + thismonthExpenditure;
                  log(totalamountthismonth.toString());
                  int total = 0;
                  for (var element in grouptransaction[date]!) {
                    if (element['category_id'] == 'Salary') {
                      total = total + element['amount'] as int;
                    } else {
                      total = total - element['amount'] as int;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text(
                            currencyformat.format(total),
                            style: const TextStyle(fontSize: 16),
                          ),
                          tileColor: Colors.white,
                          title: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Text(
                                  dateonly.length < 2 ? '0$dateonly' : dateonly,
                                  style: const TextStyle(fontSize: 32),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    day,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    monthyear.toString(),
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                          thickness: 2,
                        ),

                        //!test

                        //!working

                        ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: grouptransaction[date]!.length,
                          itemBuilder: (BuildContext context, int indexnew) {
                            return InkWell(
                              onTap: (() {
                                context.router.push(InfoDetailRoute(
                                    amount: grouptransaction[date]![indexnew]
                                        ['amount'],
                                    date: datetime,
                                    categoryname:
                                        grouptransaction[date]![indexnew]
                                            ['category_id'],
                                    transactionid:
                                        grouptransaction[date]![indexnew]
                                            ['transaction_id'],
                                    categoryid: cateogoryid[indexnew]));
                              }),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18, right: 18, top: 12),
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
                                              grouptransaction[date]![indexnew]
                                                  ['category_id'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            const Text(
                                              "Optional text",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      currencyformat.format(
                                          grouptransaction[date]![indexnew]
                                              ['amount']),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: cateogoryname[indexnew] ==
                                                      'Other Income' ||
                                                  cateogoryname[indexnew] ==
                                                      'Salary'
                                              ? Colors.blue
                                              : Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                })),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
