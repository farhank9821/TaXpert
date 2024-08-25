import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Home_Screen/regime/new_regime.dart';
import 'package:tax_xpert/Home_Screen/regime/old_regime.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/user_model.dart';

class HomeSummary extends ConsumerStatefulWidget {
  const HomeSummary({super.key});

  @override
  _HomeSummaryState createState() => _HomeSummaryState();
}

class _HomeSummaryState extends ConsumerState<HomeSummary> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userProvider);
    ref.listen<UserModel>(userProvider, (previous, next) {
      ref.read(taxCalculationProvider.notifier).calculateTax(next);
    });
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(text: 'New Regime'),
                Tab(text: 'Old Regime'),
              ],
            ),
          ),
        ),
        Container(
          height: 400,
          color: theme.colorScheme.primary,
          child: TabBarView(
            controller: _tabController,
            children: const [NewRegime(), OldRegime()],
          ),
        ),
      ],
    );

    // Tab Bar View
  }
}
