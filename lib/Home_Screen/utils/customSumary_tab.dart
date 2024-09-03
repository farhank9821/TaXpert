import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
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
      ref.read(taxCalculationProvider.notifier).calculateTax(next, ref);
    });
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  color: theme.colorScheme.onTertiary,
                  shape: BoxShape.rectangle),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: Tab(text: 'New Regime'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Tab(text: 'Old Regime'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
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
