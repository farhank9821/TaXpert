import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          'Profile Details',
          style: TextStyle(color: Color(0xffffffff)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // CustomTextField(
              //   hintText: "Kalpesh Jangir",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
