// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import 'package:moneylover/router/router.gr.dart';
import 'package:moneylover/services/serviceApi.dart';
import 'package:moneylover/widgets/snackbar.dart';

class AddPage extends StatefulWidget {
  var format = DateFormat("dd-MM-yyyy");

  DateTime? initialdate = DateTime(2010);
  Timestamp? datetime2;

  @override
  State<AddPage> createState() => _AddpageState();
}

class _AddpageState extends State<AddPage> {
  var format = DateFormat("dd-MMMM-yyyy");
  DateTime? initialdate = DateTime(2010);
  Timestamp? datetime2;
  var datetimenow =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Widget _dataofbirth() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DateTimeField(
              decoration: const InputDecoration(
                label: Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // hintText: 'Today',
              ),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2025),
                        helpText: "SELECT DATE",
                        cancelText: "CANCEL",
                        confirmText: "OK",
                        fieldHintText: "DATE/MONTH/YEAR",
                        fieldLabelText: "ENTER DATE",
                        errorFormatText: "INVALID FORMAT",
                        errorInvalidText: "INPUT INTEGERS ONLY")
                    .then((value) {
                  setState(() {
                    datetime2 = Timestamp.fromDate(value!);
                  });

                  return value;
                });
              },
            ),
          ),
        ]);
  }

  String resultvalue = 'Select Category';
  String categoryid = '';

  TextEditingController amountcontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await context.router.push(const SelectionRoute());
    if (!mounted) return;
    var item = await ServiceApi().getspecificcategory(id: result.toString());
    setState(() {
      resultvalue = item['name'];
      categoryid = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(26, 250, 250, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                tileColor: Colors.white,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        resultvalue = 'Select Category';
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.black,
                    )),
                title: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Add Transaction',
                  ),
                ),
                trailing: InkWell(
                  onTap: () async {
                    if (amountcontroller.text.isEmpty || categoryid.isEmpty) {
                      CustomSnackbar(
                          context,
                          const SizedBox(
                            height: 50,
                            child: Center(
                                child: Text(
                                    "  Please fill in the Fields first !")),
                          ),
                          const Color.fromARGB(255, 221, 128, 121));
                    } else {
                      EasyLoading.show(status: 'Adding please wait..');

                      await ServiceApi().addtransaction(
                          amount: int.parse(amountcontroller.text),
                          categoryid: categoryid,
                          notes: notecontroller.text,
                          date:
                              datetime2 ?? Timestamp.fromDate(DateTime.now()));
                      CustomSnackbar(
                          context,
                          const SizedBox(
                              height: 50,
                              child: Center(
                                  child: Text(" ☑️ Successfully added"))),
                          const Color.fromARGB(255, 113, 187, 116));

                      log("added transaction(serviceApi)");
                      EasyLoading.dismiss();

                      setState(() {
                        resultvalue = 'Select Category';
                        log("set state");
                      });
                      context.router.popAndPush(const AuthFlowRoute());
                      log(" authflow pop n push");
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'SAVE',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 340,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.currency_rupee_sharp),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              controller: amountcontroller,
                              decoration: const InputDecoration(
                                  hintText: 'Enter Amount'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.question_mark_outlined),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              showCursor: false,
                              onTap: () {
                                _navigateAndDisplaySelection(context);
                              },
                              decoration:
                                  InputDecoration(hintText: resultvalue),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.notes_outlined),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              controller: notecontroller,
                              decoration: const InputDecoration(
                                  hintText: 'Write note (optional)'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Flexible(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: _dataofbirth()),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    title: Text(
                      "If date is not selected, current date will be choosen as default.",
                      style: TextStyle(color: Colors.red[900], fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
