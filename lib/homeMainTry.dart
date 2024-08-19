import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/userDetail/entryField.dart';

class HomeScreenTry extends ConsumerStatefulWidget {
  const HomeScreenTry({super.key});

  @override
  ConsumerState<HomeScreenTry> createState() => _HomeScreenTryState();
}

class _HomeScreenTryState extends ConsumerState<HomeScreenTry> {
  @override
  Widget build(BuildContext context) {
    final cal = ref.watch(calculationModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(cal.grossIncome.toString()),
            Text(cal.standardDeductionOld.toString()),
            Text(cal.taxableIncomeNew.toString()),
            Text(cal.taxPayableOld.toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaxDeductionForm(),
                  ),
                );
              },
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
