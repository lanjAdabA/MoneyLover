import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneylover/logic/fetchrecentdata/cubit/fetchrecentdata_cubit.dart';

import 'package:moneylover/pages/transaction.page.dart';
import 'package:moneylover/router/router.gr.dart';

class AllRecentsPage extends StatefulWidget {
  const AllRecentsPage({super.key});

  @override
  State<AllRecentsPage> createState() => _AllRecentsPageState();
}

class _AllRecentsPageState extends State<AllRecentsPage> {
  @override
  Widget build(BuildContext context) {
    final recent = context.watch<FetchrecentdataCubit>().state;

    List categoryname = recent.categoryname;

    List transactionid = recent.transactionid;

    List transaction = recent.transaction;
    List categoryid = recent.categoryid;
    // List transactionidlist = recent.transactionidlist;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          //!des bar

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_downward,
                                        color: Colors.red,
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Transaction details",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: categoryname.length,
                                  itemBuilder: ((context, index) {
                                    Timestamp date = transaction[index]['date'];
                                    var datetime = date.toDate();
                                    var datefinal =
                                        DateFormat.yMMMd().format(datetime);

                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.router.push(InfoDetailRoute(
                                                amount: transaction[index]
                                                    ["amount"],
                                                date: datetime,
                                                categoryname:
                                                    categoryname[index],
                                                transactionid:
                                                    transactionid[index],
                                                categoryid: transaction[index]
                                                    ["category_id"]));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ListTile(
                                              leading: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: const [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 43, 56, 96),
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
                                                    categoryname[index],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: categoryname[
                                                                        index] ==
                                                                    'Salary' ||
                                                                categoryname[
                                                                        index] ==
                                                                    "Other Income"
                                                            ? Colors.blue
                                                            : Colors.red),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    datefinal.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                              trailing: Text(
                                                currencyformat.format(
                                                    transaction[index]
                                                        ['amount']),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: categoryname[
                                                                    index] ==
                                                                'Salary' ||
                                                            categoryname[
                                                                    index] ==
                                                                "Other Income"
                                                        ? Colors.blue
                                                        : Colors.red),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.blueGrey,
                                          thickness: 1,
                                          indent: 24,
                                          endIndent: 24,
                                        )
                                      ],
                                    );
                                  })),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
