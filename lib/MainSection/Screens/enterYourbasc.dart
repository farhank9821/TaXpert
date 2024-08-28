import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/Login_screen/loginScreen.dart';

class EntryTimeScreen extends StatefulWidget {
  const EntryTimeScreen({super.key});

  @override
  State<EntryTimeScreen> createState() => _EntryTimeScreenState();
}

class _EntryTimeScreenState extends State<EntryTimeScreen> {
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String selectedOption = 'Yes';
    return Scaffold(
      backgroundColor: Color(0xff92B79F),
      appBar: AppBar(
        backgroundColor: Color(0xff92B79F),
        elevation: 0,
        title: Text(
          'Enter Your Details',
          style: TextStyle(color: Color(0xffffffff)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // CustomTextField(
              //   hintText: "Enter Your name",
              //   controller: controller,
              //   logo: Icon(Icons.people),
              // ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Are you salaried ?',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff25472B),
                        value: 'Yes',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Yes'),
                      const SizedBox(
                        width: 60,
                      ),
                      Radio(
                        activeColor: Color(0xff25472B),
                        value: 'No',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Residing in Metros?',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff25472B),
                        value: 'Yes',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Yes'),
                      const SizedBox(
                        width: 60,
                      ),
                      Radio(
                        activeColor: Color(0xff25472B),
                        value: 'No',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('No'),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Color(0xff25472B),
                        value: 'Yes',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Male'),
                      const SizedBox(
                        width: 60,
                      ),
                      Radio(
                        value: 'No',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(onPressed: _showDatePicker, icon: Icon(Icons.date_range))
                    ],
                  ),
                  Text(
                    'Date of Birth: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${_dateTime.day.toString()}/ ${_dateTime.month.toString()}/ ${_dateTime.year.toString()}',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(244, 42), backgroundColor: const Color(0xff263a29)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Signup();
                    }));
                  },
                  child: Text(
                    "Get started",
                    style: GoogleFonts.georama(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
