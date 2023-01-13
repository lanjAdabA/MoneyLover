import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:moneylover/router/router.gr.dart';
import 'package:moneylover/services/serviceApi.dart';

class InfoDetailPage extends StatefulWidget {
  final String transactionid;
  final String categoryid;
  final String categoryname;
  final int amount;
  final DateTime date;
  const InfoDetailPage(
      {super.key,
      required this.transactionid,
      required this.categoryid,
      required this.categoryname,
      required this.amount,
      required this.date});

  @override
  State<InfoDetailPage> createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage> {
  var currencyformat =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

  TextEditingController amountcontroller = TextEditingController();

  TextEditingController notecontroller = TextEditingController();

  var format = DateFormat("dd-MM-yyyy");
  DateTime? initialdate = DateTime(2022);
  Timestamp? datetime2;
  String datetimefordisplay = 'Today';

  Widget dateWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DateTimeField(
              decoration: InputDecoration(
                hintText: datetimefordisplay,
                hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                        context: context,
                        initialDate: widget.date,
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2025),
                        helpText: "SELECT DATE OF BIRTH",
                        cancelText: "CANCEL",
                        confirmText: "OK",
                        fieldHintText: "DATE/MONTH/YEAR",
                        fieldLabelText: "ENTER YOUR DATE OF BIRTH",
                        errorFormatText: "Enter a Valid Date",
                        errorInvalidText: "Date Out of Range")
                    .then((value) {
                  datetime2 = Timestamp.fromDate(value!);

                  log(value.toString());

                  return value;
                });
              },
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    var day = DateFormat('EEEE').format(widget.date);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text(""),
        actions: [
          const Icon(Icons.share),
          //! edit
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
                onPressed: (() async {
                  context.router.push(UpdateTransactionRoute(
                      amount: widget.amount,
                      categoryid: widget.categoryid,
                      categoryname: widget.categoryname,
                      date: widget.date,
                      transactionid: widget.transactionid));

                  // await ServiceApi().updatetransaction(
                  //     id: widget.transactionid,
                  //     categoryid: widget.categoryid,
                  //     amount: widget.amount,
                  //     date: widget.date);
                }),
                icon: const Icon(Icons.edit)),
          ),
          //!delete
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              EasyLoading.show(status: "deleting..");

              await ServiceApi()
                  .deleteexpenditureitem(id: widget.transactionid)
                  .whenComplete(() => EasyLoading.dismiss())
                  .whenComplete(() => context.router.pop());
              context.router.pop();
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 3.4,
              decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: Offset(0.0, 0.75))
                  ],
                  // border: Border(
                  //   bottom: BorderSide(color: Colors.grey),
                  // ),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.ice_skating)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          widget.categoryname,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 48),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          currencyformat.format(widget.amount),
                          style: TextStyle(
                            color: Colors.red[600],
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.notes),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text("optional message"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.calendar_month),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          '$day, ${widget.date.day}/${widget.date.month}/${widget.date.year}',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 13,
                            child: Icon(
                              Icons.wallet,
                              color: Colors.orange,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text("cash "),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Budget",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "This transaction is not under any budget, but it should be for a better financial management.",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.green,
                              side: const BorderSide(
                                width: 1.0,
                                color: Colors.green,
                              )),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('ADD BUDGET FOR THIS MONTH'),
                          ))
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
