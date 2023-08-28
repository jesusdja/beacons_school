import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
import 'package:beacons_school/src/global/provider/splash_provider.dart';
import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/widgets_utils/button_general.dart';
import 'package:beacons_school/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:beacons_school/src/modules/admin/config_beacons_page.dart';
import 'package:beacons_school/src/modules/admin/admin_home_page.dart';
import 'package:beacons_school/src/modules/parents/config_parents_page.dart';
import 'package:beacons_school/src/modules/parents/parents_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

double sizeH = 0;
double sizeW = 0;

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

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
  }

  @override
  Widget build(BuildContext context) {

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;

    final splashProvider = Provider.of<SplashProvider>(context);

    if( splashProvider.splashStatus == SplashStatus.initial ) {
      return const SelectedTypeApp();
    }
    if( splashProvider.splashStatus == SplashStatus.initialAdmin ) {
      return const ConfigBeaconsPage();
    }
    if( splashProvider.splashStatus == SplashStatus.initialParents ) {
      return const ConfigParentsPage();
    }
    if( splashProvider.splashStatus == SplashStatus.parents ) {
      return const ParentsHomePage();
    }
    if( splashProvider.splashStatus == SplashStatus.admin ) {
      return const AdminHomePage();
    }
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
          body: circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeH * 0.03,),
        )
    );
  }
}

class SelectedTypeApp extends StatelessWidget {
  const SelectedTypeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final splashProvider = Provider.of<SplashProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonGeneral(
            title: 'ADMINISTRADOR',
            onPressed: (){
              SharedPrefsLocal.statusSplash = 1;
              splashProvider.splashStatus = SplashStatus.initialAdmin;
            },
            backgroundColor: SchoolColors.primary,
            height: sizeH * 0.05,
            textStyle: SchoolStyles().stylePrimary(
                size: sizeH * 0.025,
                fontWeight: FontWeight.bold
            ),
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
          ),
          SizedBox(height: sizeH * 0.02,),
          ButtonGeneral(
            title: 'USUARIO / REPRESENTANTE',
            onPressed: (){
              SharedPrefsLocal.statusSplash = 3;
              splashProvider.splashStatus = SplashStatus.initialParents;
            },
            backgroundColor: SchoolColors.primary,
            height: sizeH * 0.05,
            textStyle: SchoolStyles().stylePrimary(
                size: sizeH * 0.025,
                fontWeight: FontWeight.bold
            ),
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
          )
        ],
      ),
    );
  }
}

