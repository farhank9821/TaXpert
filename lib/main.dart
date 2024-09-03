import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tax_xpert/Home_Screen/home.dart';
import 'package:tax_xpert/Login_screen/loginScreen.dart';
import 'package:tax_xpert/MainSection/navigationbarScreen.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';
import 'package:tax_xpert/model/user_basic_info.dart';
import 'package:tax_xpert/model/user_model.dart';
import 'package:tax_xpert/route/auth_state_route.dart';
import 'package:tax_xpert/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserBasicInfoAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserTaxCalculationAdapter());
  await Hive.openBox('authBox');
  //await Hive.openBox('taxCalculationBox');
  //await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<UserBasicInfo>('user_basic_info');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tax Xpert',
      theme: ThemeData(
        textTheme: myTextTheme,
        colorScheme: myColorScheme,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
