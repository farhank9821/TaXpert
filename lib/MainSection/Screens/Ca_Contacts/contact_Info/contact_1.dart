import 'package:flutter/material.dart';

class Firstcontact extends StatefulWidget {
  const Firstcontact({super.key});

  @override
  State<Firstcontact> createState() => _FirstcontactState();
}

class _FirstcontactState extends State<Firstcontact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF8F1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffddffbb),
          title: const Text(
            "Details",
            style: TextStyle(
              color: Color(0xff25472B),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 130,
              decoration: const BoxDecoration(
                color: Color(0xffddffbb),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
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
                      Text(
                        "C.A. Mahesh Mehta",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
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
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
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
                            child: Padding(
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
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.6/5",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Icon(
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
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "About CA",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "CA Mahesh Mehta is a renowned name when it comes to managing finances, providing expert financial and tax services to individuals and businesses for financial success",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Schedule",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Container(
                          width: 108,
                          height: 27,
                          decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "18th September",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Container(
                          width: 108,
                          height: 27,
                          decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "19th September",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Container(
                          width: 108,
                          height: 27,
                          decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "20th September",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.green,
                        child: Container(
                          width: 108,
                          height: 27,
                          decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "21st September",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Time Slot",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.green,
                      child: Container(
                        width: 70,
                        height: 27,
                        decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "10:00 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.green,
                      child: Container(
                        width: 70,
                        height: 27,
                        decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "11:00 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.green,
                      child: Container(
                        width: 70,
                        height: 27,
                        decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "12:00 PM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.green,
                      child: Container(
                        width: 70,
                        height: 27,
                        decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "01:00 PM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(244, 42), backgroundColor: Color(0xff263a29)),
                    onPressed: () {},
                    child: Text(
                      "Make appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(color: Color(0xffddffbb), borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/lawyer/coll01.jpg"),
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
                              Text(
                                "K.C College, Mumbai",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
