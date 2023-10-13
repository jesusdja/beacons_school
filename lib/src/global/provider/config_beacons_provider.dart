// ignore_for_file: use_build_context_synchronously

import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/widgets_utils/toast_widget.dart';
import 'package:beacons_school/src/global/services/firebase_connection_config_beacons.dart';
import 'package:beacons_school/src/modules/admin/admin_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConfigBeaconsProvider extends ChangeNotifier {
  bool loadData = true;
  bool loadSave = false;

  String _idBeacons = '';
  String get idBeacons => _idBeacons;
  set idBeacons(String value) {
    _idBeacons = value;
    notifyListeners();
  }

  Map<String, dynamic> _beaconsFirebase = {};
  Map<String, dynamic> get beaconsFirebase => _beaconsFirebase;
  set beaconsFirebase(Map<String, dynamic> value) {
    _beaconsFirebase = value;
    notifyListeners();
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  ConfigBeaconsProvider() {
    initialData();
  }

  Future initialData() async {
    loadData = true;
    notifyListeners();

    try {
      List<QueryDocumentSnapshot> listData =
          await FirebaseConnectionConfigBeacons().getAllAffiliates();

      if (listData.isEmpty) {
        Map<String, dynamic> data = {
          '1': {'nivel': '1', 'UUID': ''},
          '2': {'nivel': '2', 'UUID': ''},
          '3': {'nivel': '3', 'UUID': ''},
          '4': {'nivel': '4', 'UUID': ''},
          '5': {'nivel': '5', 'UUID': ''},
        };
        await FirebaseConnectionConfigBeacons().createAffiliate(data);
        initialData();
      } else {
        idBeacons = listData[0].id;
        beaconsFirebase = listData[0].data() as Map<String, dynamic>;
        controller1.text = beaconsFirebase['1']['UUID'];
        controller2.text = beaconsFirebase['2']['UUID'];
        controller3.text = beaconsFirebase['3']['UUID'];
        controller4.text = beaconsFirebase['4']['UUID'];
        controller5.text = beaconsFirebase['5']['UUID'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    loadData = false;
    notifyListeners();
  }

  Future saveData(
      {required BuildContext context, bool isConfig = false}) async {
    loadSave = true;
    notifyListeners();

    try {
      Map<String, dynamic> data = {
        '1': {'nivel': '1', 'UUID': controller1.text},
        '2': {'nivel': '2', 'UUID': controller2.text},
        '3': {'nivel': '3', 'UUID': controller3.text},
        '4': {'nivel': '4', 'UUID': controller4.text},
        '5': {'nivel': '5', 'UUID': controller5.text},
      };

      bool result = await FirebaseConnectionConfigBeacons()
          .editAffiliate(data: data, id: idBeacons);

      if (result) {
        showAlert(
          text: 'GUARDADO',
        );

        if (isConfig) {
          Navigator.of(context).pop();
        } else {
          SharedPrefsLocal.statusSplash = 3;
          // SplashProvider splashProvider =
          //     Provider.of<SplashProvider>(context, listen: false);
          // splashProvider.splashStatus = SplashStatus.admin;
          Navigator.pushReplacementNamed(context, AdminHomePage.route);
        }
      } else {
        showAlert(text: 'Problema para enviar la informacion', isError: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    loadSave = false;
    notifyListeners();
  }
}
