import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tax_xpert/Home_Screen/home.dart';
import 'package:tax_xpert/MainSection/Screens/calculator.dart';
import 'package:tax_xpert/MainSection/Screens/HomeScreen.dart';
import 'package:tax_xpert/MainSection/Screens/insights.dart';

import 'Screens/profileScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CalculatorScreen(),
    NewsScreen(),
    const ProfileScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xff92B79F),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              backgroundColor: const Color(0xff92B79F),
              onTabChange: onTap,
              selectedIndex: currentTab,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  iconColor: Color(0xff41854e),
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.calculator,
                  iconColor: Color(0xff41854e),
                  text: 'Calculator',
                ),
                GButton(
                  icon: LineIcons.newspaper,
                  iconColor: Color(0xff41854e),
                  text: 'Analytics',
                ),
                GButton(
                  icon: LineIcons.user,
                  iconColor: Color(0xff41854e),
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
