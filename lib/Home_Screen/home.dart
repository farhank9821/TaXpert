import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tax_xpert/Home_Screen/utils/customSumary_tab.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/Home_Screen/summary.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/Home_Screen/utils/tab_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    final taxCalculation = ref.watch(taxCalculationProvider);
    final userbasic = ref.watch(userBasicProvider);
    ref.listen<UserModel>(userProvider, (previous, next) {
      ref.read(taxCalculationProvider.notifier).calculateTax(next, ref);
    });

    String name = userbasic.name;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const HomeSummary(),
              const SizedBox(height: 20),
              if ((taxCalculation.grossIncome ?? 0.0) > 0)
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onTertiary,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.8),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if ((taxCalculation.differenceBetween ?? 0.0) > 0)
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.onTertiary,
                          child: Image.asset('assets/profits.png'),
                        ),
                      if ((taxCalculation.differenceBetween ?? 0.0) < 0)
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.onTertiary,
                          child: Image.asset('assets/loss.png'),
                        ),
                      const SizedBox(width: 8.0), // Adjust spacing between avatar and text
                      Text(taxCalculation.differenceBetween.toString(), style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              const CustomTabScreen(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
