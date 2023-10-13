import 'package:beacons_school/initial_page.dart';
import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
import 'package:beacons_school/src/global/provider/parents_beacons_provider.dart';
import 'package:beacons_school/src/global/provider/splash_provider.dart';
import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/modules/parents/config_parents_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParentsHomePage extends StatefulWidget {
  const ParentsHomePage({Key? key}) : super(key: key);

  static const String route = '/parents_home_page';

  @override
  State<ParentsHomePage> createState() => _ParentsHomePageState();
}

class _ParentsHomePageState extends State<ParentsHomePage> {
  late ParentsBeaconsProvider parentsBeaconsProvider;

  @override
  void dispose() {
    super.dispose();
    parentsBeaconsProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashProvider = context.read<SplashProvider>();
    return ChangeNotifierProvider(
        create: (context1) => ParentsBeaconsProvider(context: context),
        child: Consumer<ParentsBeaconsProvider>(
            builder: (context, provider, child) {
          parentsBeaconsProvider = provider;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ConfigParentsPage.route,
                      arguments: true,
                    );
                  },
                ),
                IconButton(
                    onPressed: () async {
                      SharedPrefsLocal.isLogged = false;
                      SharedPrefsLocal.statusSplash = 0;
                      splashProvider.splashStatus = SplashStatus.initial;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        InitialPage.route,
                        (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                    ))
              ],
            ),
            body: body(),
          );
        }));
  }

  Widget body() {
    Widget widgetHome = Container();

    if (parentsBeaconsProvider.nivelSelected.isEmpty) {
      widgetHome = Container(
        height: sizeH * 0.2,
        width: sizeH * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/image/no-data.gif").image,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    if (parentsBeaconsProvider.nivelSelected.isNotEmpty) {
      widgetHome = Container(
        width: sizeW,
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
        child: Text('NIVEL ${parentsBeaconsProvider.nivelSelected}',
            textAlign: TextAlign.center,
            style: SchoolStyles().stylePrimary(
                size: sizeH * 0.1,
                fontWeight: FontWeight.bold,
                color: SchoolColors.primary)),
      );
    }

    return Center(
      child: widgetHome,
    );
  }
}
