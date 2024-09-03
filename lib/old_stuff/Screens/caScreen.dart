import 'package:flutter/material.dart';
import 'package:tax_xpert/old_stuff/Screens/Ca_Contacts/contact_Info/contact_1.dart';
import 'package:tax_xpert/old_stuff/Screens/Ca_Contacts/contact_Info/contact_2.dart';

class caScreen extends StatefulWidget {
  const caScreen({super.key});

  @override
  State<caScreen> createState() => _caScreenState();
}

class _caScreenState extends State<caScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEFF8F1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Charted Accountants",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Text(
                  "Proficient CA's to get help from",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search...",
                      filled: true,
                      fillColor: const Color(0xffddffbb)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Text(
                  "All CA's around you",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Firstcontact();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Container(
                        width: 340,
                        height: 130,
                        decoration: BoxDecoration(color: const Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/lawyer/01.jpg"),
                                radius: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "C.A. Mahesh Mehta",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  "Dadar,Mumbai",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 63,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          "+5 years",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 70,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          "+100 clients",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 63,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 2.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "4.6/5",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Secondcontact();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Container(
                        width: 340,
                        height: 130,
                        decoration: BoxDecoration(color: const Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/lawyer/02.jpg"),
                                radius: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "C.A. Manas Kogta",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  "Churchgate,Mumbai",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 63,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          "+3 years",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 70,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          "+150 clients",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 63,
                                      height: 23,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 2.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "4.8/5",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Container(
                      width: 340,
                      height: 130,
                      decoration: BoxDecoration(color: const Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/lawyer/03.jpg"),
                              radius: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "C.A. Karan Gupta",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              const Text(
                                "Bandra,Mumbai",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+7 years",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+300 clients",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4.9/5",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Container(
                      width: 340,
                      height: 130,
                      decoration: BoxDecoration(color: const Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/lawyer/04.jpg"),
                              radius: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "C.A. Krishna Singh",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              const Text(
                                "Andheri,Mumbai",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+2 years",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+100 clients",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4.3/5",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Container(
                      width: 340,
                      height: 130,
                      decoration: BoxDecoration(color: const Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/lawyer/05.jpg"),
                              radius: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "C.A. Raj Goyal",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              const Text(
                                "Borivali,Mumbai",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+10 years",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        "+500 clients",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 63,
                                    height: 23,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4.6/5",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
