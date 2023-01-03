import 'package:flutter/material.dart';
import 'package:moneylover/pages/account.page.dart';
import 'package:moneylover/pages/add.page.dart';
import 'package:moneylover/pages/homedashboard.dart';
import 'package:moneylover/pages/planning.page.dart';
import 'package:moneylover/pages/transaction.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void navigationBottomBar(int index) {
    setState(() {
      selectedIndex = index;
      // HapticFeedback.lightImpact();
    });
  }

  final List pageList = [
    const HomeDashboardPage(),
    const TransactionPage(),
    AddPage(),
    const PlanningPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackButtonPressed(BuildContext context) async {
      bool exitApp = await showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              buttonPadding: const EdgeInsets.all(20),
              title: const Text("Are you sure you want to exit?"),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200]),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          }));

      return exitApp;
    }

    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        body: pageList.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(202, 247, 247, 250),
            selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
            unselectedItemColor: const Color.fromARGB(255, 158, 160, 155),
            currentIndex: selectedIndex,
            selectedFontSize: 16,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            // enableFeedback: true,
            onTap: navigationBottomBar,
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      child: const Icon(Icons.home)),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      child: const Icon(Icons.wallet_rounded)),
                  label: "Transaction"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      child: const Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 46,
                      )),
                  label: ""
                  // label: "Add",
                  ),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      child: const Icon(Icons.bar_chart)),
                  label: "Planning"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      child: const Icon(Icons.person)),
                  label: "Account"),
            ]),
      ),
    );
    Size size = MediaQuery.of(context).size;
  }
}

//! alpha code section