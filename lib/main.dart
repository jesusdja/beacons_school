import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/provider/splash_provider.dart';
import 'package:beacons_school/src/global/provider/config_beacons_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'initial_page.dart';

//FDA50693-A4E2-4FB1-AFCF-C6EB07647825
//FDA50693-A4E2-4FB1-AFCF-C6EB07647828
//E2c56db5-dffb-48d2-b060-d0f5a71096e0

//00000000-0000-0000-0000-000000000000
//11111111-1111-1111-1111-111111111111
//22222222-2222-2222-2222-222222222222
//33333333-3333-3333-3333-333333333333
//44444444-4444-4444-4444-444444444444

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp();
  await SharedPrefsLocal.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: ( _ ) => SplashProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => ConfigBeaconsProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beacons School',
      home: InitialPage(),
    );
  }
}
