import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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

import 'Profile_Screen/profileScreen.dart';

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
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
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
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Age ${userbasic.age}',
                        style: GoogleFonts.nunito(
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
          color: Theme.of(context).colorScheme.onTertiary,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              backgroundColor: Theme.of(context).colorScheme.onTertiary,
              onTabChange: onTap,
              selectedIndex: currentTab,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).colorScheme.surface,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.calculator,
                  iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  text: 'Calculator',
                ),
                GButton(
                  icon: LineIcons.newspaper,
                  iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  text: 'Analytics',
                ),
                GButton(
                  icon: LineIcons.user,
                  iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
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
