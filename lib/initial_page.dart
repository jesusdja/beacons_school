import 'package:beacons_school/src/global/provider/splash_provider.dart';
import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:beacons_school/src/global/widgets_utils/my_button.dart';
import 'package:beacons_school/src/modules/admin/config_beacons_page.dart';
import 'package:beacons_school/src/modules/admin/admin_home_page.dart';
import 'package:beacons_school/src/modules/auth/login_page.dart';
import 'package:beacons_school/src/modules/parents/config_parents_page.dart';
import 'package:beacons_school/src/modules/parents/parents_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

double sizeH = 0;
double sizeW = 0;

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Future.delayed(const Duration(milliseconds: 2000), () {
      final splashProvider =
          Provider.of<SplashProvider>(context, listen: false);

      if (splashProvider.splashStatus == SplashStatus.initial) {
        Navigator.pushReplacementNamed(context, SelectedTypeApp.route);
      }
      if (splashProvider.splashStatus == SplashStatus.login) {
        Navigator.pushReplacementNamed(context, LoginPage.route);
      }
      if (splashProvider.splashStatus == SplashStatus.initialAdmin) {
        Navigator.pushReplacementNamed(context, ConfigBeaconsPage.route);
      }
      if (splashProvider.splashStatus == SplashStatus.initialParents) {
        Navigator.pushReplacementNamed(context, ConfigParentsPage.route);
      }
      if (splashProvider.splashStatus == SplashStatus.parents) {
        Navigator.pushReplacementNamed(context, ParentsHomePage.route);
      }
      if (splashProvider.splashStatus == SplashStatus.admin) {
        Navigator.pushReplacementNamed(context, AdminHomePage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    return const BasicSplash();
  }
}

class BasicSplash extends StatelessWidget {
  const BasicSplash({Key? key}) : super(key: key);

  Future<bool> exit() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: exit,
        child: Scaffold(
          body: circularProgressColors(
            widthContainer1: sizeW,
            widthContainer2: sizeH * 0.03,
          ),
        ));
  }
}

class SelectedTypeApp extends StatelessWidget {
  const SelectedTypeApp({Key? key}) : super(key: key);

  static const String route = '/selected_type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
                onPressed: () {
                  SharedPrefsLocal.statusSplash = 2;
                  Navigator.pushReplacementNamed(context, LoginPage.route);
                },
                text: 'ADMINISTRADOR'),
            const SizedBox(height: 20),
            MyButton(
                onPressed: () {
                  SharedPrefsLocal.statusSplash = 4;
                  Navigator.pushReplacementNamed(context, LoginPage.route);
                  // splashProvider.splashStatus = SplashStatus.initialParents;
                },
                text: 'USUARIO / REPRESENTANTE'),

            /* ButtonGeneral(
              title: 'ADMINISTRADOR',
              onPressed: () {
                SharedPrefsLocal.statusSplash = 1;
                // splashProvider.splashStatus = SplashStatus.initialAdmin;
                splashProvider.splashStatus = SplashStatus.login;
              },
              backgroundColor: SchoolColors.primary,
              height: sizeH * 0.05,
              textStyle: SchoolStyles()
                  .stylePrimary(size: sizeH * 0.025, fontWeight: FontWeight.bold),
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
            ),
            SizedBox(
              height: sizeH * 0.02,
            ),
            ButtonGeneral(
              title: 'USUARIO / REPRESENTANTE',
              onPressed: () {
                SharedPrefsLocal.statusSplash = 3;
                splashProvider.splashStatus = SplashStatus.login;
                splashProvider.splashStatus = SplashStatus.initialParents;
              },
              backgroundColor: SchoolColors.primary,
              height: sizeH * 0.05,
              textStyle: SchoolStyles()
                  .stylePrimary(size: sizeH * 0.025, fontWeight: FontWeight.bold),
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
            )*/
          ],
        ),
      ),
    );
  }
}
