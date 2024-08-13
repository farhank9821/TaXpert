import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_xpert/MainSection/Screens/exemptionNdeduction.dart';
import 'package:tax_xpert/MainSection/Screens/insights.dart';
import 'package:tax_xpert/MainSection/Screens/salaryNincome.dart';

import 'caScreen.dart';
import 'loginScreen.dart';

class NewTaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  NewTaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class TaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  TaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    initSharedPreferences();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  double totalSalary = 0.0;

  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Retrieve the totalSalary from SharedPreferences
    double savedTotalSalary = prefs.getDouble('totalSalary') ?? 0.0;
    setState(() {
      totalSalary = savedTotalSalary;
    });
  }

  Future<void> saveTotalSalaryToSharedPreferences(double totalSalary) async {
    // Save the totalSalary to SharedPreferences
    await prefs.setDouble('totalSalary', totalSalary);
  }

  double newRegimeIncomeTaxCalc(double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      NewTaxSlab(0, 250000, 0.05),
      NewTaxSlab(250000, 500000, 0.1),
      NewTaxSlab(500000, 750000, 0.15),
      NewTaxSlab(750000, 1000000, 0.2),
      NewTaxSlab(1000000, 1250000, 0.25),
      NewTaxSlab(1250000, 1500000, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  double oldRegimeIncomeTaxCalc(double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      TaxSlab(0, 250000, 0.05),
      TaxSlab(250000, 500000, 0.2),
      TaxSlab(500000, double.infinity, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  @override
  Widget build(BuildContext context) {
    double oldRegimeTaxRate = 0.30; // 30%
    double newRegimeTaxRate = 0.20; // 20%

    // double oldRegimeTaxAmount = totalSalary * oldRegimeTaxRate;
    // double newRegimeTaxAmount = totalSalary * newRegimeTaxRate;
    // double ans = newRegimeTaxAmount - oldRegimeTaxAmount;

    double oldRegimeTaxAmount = oldRegimeIncomeTaxCalc(totalSalary, 50000);
    double newRegimeTaxAmount = newRegimeIncomeTaxCalc(totalSalary, 50000);
    // if (newRegimeTaxAmount >= oldRegimeTaxAmount) {
    //   double ans = newRegimeTaxAmount - oldRegimeTaxAmount;
    // } else {
    //   double ans = oldRegimeTaxAmount - newRegimeTaxAmount;
    // }
    double ans = oldRegimeTaxAmount - newRegimeTaxAmount;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff92B79F),
        appBar: AppBar(
          backgroundColor: const Color(0xff92B79F),
          elevation: 0,
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(fontSize: 25),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_rounded),
            )
          ],
        ),
        drawer: const MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffEFF8F1),
          child: CircleAvatar(
            child: Image.asset('assets/chatBot_intructor.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome back Kalpesh",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xff333333,
                      ),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Material(
                    color: const Color(0xff92B79F),
                    elevation: 4,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Ye implement karna
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              //borderSide: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xff333333),
                            ),
                            hintText: "Search...",
                            filled: true,
                            fillColor: const Color(0xffEFF8F1)),
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        color: const Color(0xffeff8f1),
                        elevation: 8, // Adjust the elevation value as needed
                        borderRadius: BorderRadius.circular(20.0),
                        borderOnForeground: true, //
                        child: Container(
                          width: 150,
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color.fromARGB(255, 135, 47, 65), width: 2 // Set the border color to green
                                // Set the border width as needed
                                ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Old Regime",
                                style: TextStyle(fontSize: 15, color: Color(0xff333333), fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '₹${oldRegimeTaxAmount.toStringAsFixed(2)}',
                                    style: const TextStyle(fontSize: 23),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Material(
                          color: const Color(0xffeff8f1),
                          elevation: 8, // Adjust the elevation value as needed
                          borderRadius: BorderRadius.circular(20.0),
                          borderOnForeground: true, //

                          child: Container(
                            width: 150,
                            height: 225,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: const Color(0xff2F873C), width: 2
                                  // Set the border color to green
                                  // Set the border width as needed
                                  ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "New Regime",
                                  style: TextStyle(fontSize: 15, color: Color(0xff333333), fontWeight: FontWeight.bold),
                                ),
                                const Divider(thickness: 1),
                                Column(
                                  children: [
                                    Text('₹${newRegimeTaxAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 23)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Center(
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffEFF8F1),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xff2F873C), width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          if (ans >= 0)
                            Row(
                              children: [
                                const Text("Profit : ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff25472B),
                                    )),
                                Text('₹${ans.toStringAsFixed(2)}',
                                    style: const TextStyle(fontSize: 20, color: Color(0xff333333), fontWeight: FontWeight.bold)),
                              ],
                            )
                          else
                            Row(
                              children: [
                                const Text("Loss : ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 177, 1, 25),
                                    )),
                                Text('₹${ans.toStringAsFixed(2)}',
                                    style: const TextStyle(fontSize: 20, color: Color(0xff333333), fontWeight: FontWeight.bold)),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                //! On screen Tab bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        Container(
                          // height: 50,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(color: const Color(0xff41854e), borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: Colors.black,
                                  indicatorColor: const Color(0xffEFF8F1),
                                  indicatorWeight: 2,
                                  indicator: BoxDecoration(
                                    color: const Color(0xffEFF8F1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  controller: tabController,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        "Salary & Income",
                                        softWrap: true,
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Exmeption & Deduction',
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: const [SalaryandIncome(), ExmeptionAndDeduction()],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffEFF8F1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff2F873C),
            ),
            child: Column(
              children: [
                Text(
                  'TaxXpert',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/userPic.jpg'),
                ),
                Text(
                  'Kalpesh Jangir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text(
              'CA',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const caScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              'About',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
            },
          ),
        ],
      ),
    );
  }
}
