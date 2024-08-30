import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tax_xpert/Home_Screen/home.dart';
import 'package:tax_xpert/Diff_calcs/calculator.dart';
import 'package:tax_xpert/AnalyticScreen/Analytic_Screen.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
import 'package:tax_xpert/model/user_basic_info.dart';
import 'package:tax_xpert/model/user_model.dart';

import '../Profile_Screen/profileScreen.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  ConsumerState<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends ConsumerState<BottomNavigationScreen> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CalculatorScreen(),
    const ReportGeneratorScreen(),
    const Profile_Screen(),
  ];

  void onTap(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userBasicProvider.notifier);
    ref.listen<UserModel>(userProvider, (previous, next) {
      ref.read(taxCalculationProvider.notifier).calculateTax(next, ref);
    });
    final userbasic = ref.watch(userBasicProvider);

    String name = userbasic.name;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[700],
                    child: Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$name's TaXpert",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Age ${userbasic.age}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
