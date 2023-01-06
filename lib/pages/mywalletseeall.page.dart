// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:moneylover/logic/fetchdata/cubit/fetchdata_cubit.dart';
import 'package:moneylover/router/router.gr.dart';

class MyWalletsPage extends StatefulWidget {
  const MyWalletsPage({super.key});

  @override
  State<MyWalletsPage> createState() => _MyWalletsPageState();
}

class _MyWalletsPageState extends State<MyWalletsPage> {
  @override
  Widget build(BuildContext context) {
    var currencyformat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final s = context.watch<FetchdataCubit>().state;

    int totalamount = s.amount;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 1,
        leading: const BackButton(),
        title: const Text(
          "My Wallets",
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.info_outline),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
                child: Text(
              "Edit",
              style: TextStyle(fontSize: 16),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "You will be able to view transaction for each wallet here.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            )),
            InkWell(
              onTap: () {
                context.router.push(const TransactionRoute());
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 217, 215, 215))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 8,
                        width: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ),
                      const Icon(
                        Icons.blur_circular,
                        size: 48,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Total"),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              currencyformat.format(totalamount),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    "Included in Total",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                context.router.push(const TransactionRoute());
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey[700]),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.wallet,
                            color: Colors.orange,
                            size: 30,
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Cash"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        currencyformat.format(totalamount),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
