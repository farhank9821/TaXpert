import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/MainSection/navigationbarScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff92B79F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Create Account",
                style: GoogleFonts.exo(fontWeight: FontWeight.w800, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                "Enter the required details!",
                style: GoogleFonts.exo(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 340,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey.shade600,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 340,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey.shade600,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 340,
                child: TextFormField(
                  obscureText: isShowPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.grey.shade600,
                      ),
                      suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 340,
                child: TextFormField(
                  obscureText: isShowPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff2638a29)),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.grey.shade600,
                      ),
                      suffixIcon: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      hintText: " Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(244, 42), backgroundColor: const Color(0xff263a29)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BottomNavigationScreen();
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
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xffa0a0a0)),
                ),
                const SizedBox(
                  width: 5,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Login here",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff23d48e),
                    ),
                  ),
                  onPressed: () {},
                  // onPressed: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) {
                  //     return const Login();
                  //   }));
                  // }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
