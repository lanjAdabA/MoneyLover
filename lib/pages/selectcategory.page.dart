// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moneylover/logic/type.dart';
import 'package:moneylover/services/serviceapi.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<SelectionPage> {
  final CollectionReference categorylist =
      FirebaseFirestore.instance.collection('category');
  TextEditingController categorynamecontroller = TextEditingController();
  TextEditingController addcategorynamecontroller = TextEditingController();
  type categorytype = type.Income;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        actions: [
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 60, top: 7, bottom: 7, right: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 246, 242, 242),
                ),
                height: 30,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      cursorHeight: 22,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Type a category\'s name',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 245, 243, 243),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: categorylist.snapshots(),
                      builder: (context, streamsnapshot) {
                        if (streamsnapshot.hasData) {
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: streamsnapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamsnapshot.data!.docs[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                      streamsnapshot.data!.docs[index].id
                                          .toString(),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: ListTile(
                                      tileColor: Colors.white,
                                      title: Text(
                                        documentSnapshot['name'],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                        } else {
                          return const SizedBox(
                            height: 50,
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: ((context, setState) {
                              return Scaffold(
                                backgroundColor:
                                    const Color.fromARGB(26, 250, 250, 250),
                                body: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ListTile(
                                          tileColor: Colors.white,
                                          leading: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                size: 30,
                                                color: Colors.black,
                                              )),
                                          title: const Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'New Category',
                                            ),
                                          ),
                                          trailing: InkWell(
                                            onTap: () async {
                                              await ServiceApi().addcategoryitem(
                                                  name:
                                                      addcategorynamecontroller
                                                          .text,
                                                  type: categorytype.name);
                                              Navigator.pop(context);

                                              addcategorynamecontroller.clear();

                                              categorytype = type.Income;
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(20.0),
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
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 52,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.grey,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: const Icon(Icons
                                                        .question_mark_outlined),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: TextFormField(
                                                        controller:
                                                            addcategorynamecontroller,
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    'Enter Category Name'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: RadioListTile(
                                                        activeColor:
                                                            Colors.green,
                                                        toggleable: true,
                                                        title: const Text(
                                                          "Income",
                                                        ),
                                                        value: type.Income,
                                                        groupValue:
                                                            categorytype,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            categorytype =
                                                                value as type;
                                                          });
                                                        }),
                                                  ),
                                                  Flexible(
                                                    child: RadioListTile(
                                                        activeColor:
                                                            Colors.green,
                                                        title: const Text(
                                                          "Expense",
                                                        ),
                                                        value: type.Expense,
                                                        groupValue:
                                                            categorytype,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            categorytype =
                                                                value as type;
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                          },
                        );
                      },
                      child: const ListTile(
                        tileColor: Colors.white,
                        leading: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                        title: Text(
                          'NEW CATEGORY',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
