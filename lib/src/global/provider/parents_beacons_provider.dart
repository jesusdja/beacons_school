
import 'dart:async';
import 'dart:io';
import 'package:beacons_school/src/global/provider/config_beacons_provider.dart';
import 'package:beacons_school/src/global/services/firebase_connection_parents.dart';
import 'package:beacons_school/src/global/services/permission_handler.dart';
import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:provider/provider.dart';

class ParentsBeaconsProvider extends ChangeNotifier {

  bool loadData = true;
  StreamSubscription? _streamRanging;
  late BuildContext contextHome;
  List<Beacon> beacons = [];

  Map<String,dynamic> beaconsFirebase = {};

  String nivelSelected = '';
  int contChange = 0;

  ParentsBeaconsProvider({required BuildContext context}){
    contextHome = context;
    initialData();
  }

  @override
  void dispose() {
    super.dispose();
    _streamRanging?.cancel();
  }

  Future initialData() async{
    loadData = true; notifyListeners();

    try{
      bool result = await PermissionHandlerClass().permissionBluetooth();
      if(result){
        bool result2 = await PermissionHandlerClass().permissionBluetoothScan();
        if(result2){
          bool result3 = await PermissionHandlerClass().permissionBluetoothConnect();
          if(result3){
            bool result4 = await PermissionHandlerClass().permissionBluetoothAdvertise();
            if(result4){
              await flutterBeacon.initializeScanning;
              await flutterBeacon.initializeAndCheckScanning;
              playSearch();
            }else{
              initialData();
            }
          }else{
            initialData();
          }
        }else{
          initialData();
        }
      }else{
        initialData();
      }
    }catch(e){
      debugPrint('initialSensor : ${e.toString()}');
    }

    loadData = false; notifyListeners();
  }

  Future playSearch() async {
    try{
      final regions = <Region>[];
      if (Platform.isIOS) {
        regions.add(Region(identifier: 'Apple Airlocate',proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
      } else {
        regions.add(Region(identifier: 'com.beacon',));
      }

      _streamRanging = flutterBeacon.ranging(regions).listen((RangingResult result) async {
        //ENVIA DATA ENCONTRADA
        debugPrint('BEACONS SENSOR: ${result.beacons}');
        beacons = result.beacons;
        notifyListeners();
        checkBeacons(beaconsAll: result.beacons);
      });
    }catch(e){
      debugPrint('initialSensor : ${e.toString()}');
    }
  }

  Future checkBeacons({required List<Beacon> beaconsAll}) async {
    try{
      beaconsFirebase = Provider.of<ConfigBeaconsProvider>(contextHome,listen: false).beaconsFirebase;

      if(beaconsFirebase.isNotEmpty){
        String uuid1 = beaconsFirebase['1']['UUID'];
        String uuid2 = beaconsFirebase['2']['UUID'];
        String uuid3 = beaconsFirebase['3']['UUID'];
        String uuid4 = beaconsFirebase['4']['UUID'];
        String uuid5 = beaconsFirebase['5']['UUID'];

        String nivel = '';
        bool updateFirebase = false;
        for(int x = 0; x < beaconsAll.length; x++){
          Beacon beacon = beaconsAll[x];
          String nivelAux = '';
          if(beacon.proximityUUID.replaceAll('-', '').toLowerCase() == uuid1.replaceAll('-', '').toLowerCase()){ nivelAux = '1'; }
          if(beacon.proximityUUID.replaceAll('-', '').toLowerCase() == uuid2.replaceAll('-', '').toLowerCase()){ nivelAux = '2'; }
          if(beacon.proximityUUID.replaceAll('-', '').toLowerCase() == uuid3.replaceAll('-', '').toLowerCase()){ nivelAux = '3'; }
          if(beacon.proximityUUID.replaceAll('-', '').toLowerCase() == uuid4.replaceAll('-', '').toLowerCase()){ nivelAux = '4'; }
          if(beacon.proximityUUID.replaceAll('-', '').toLowerCase() == uuid5.replaceAll('-', '').toLowerCase()){ nivelAux = '5'; }
          if(nivel.isEmpty || int.parse(nivelAux) < int.parse(nivel)){
            nivel = nivelAux;
          }
        }

        if((nivel.isNotEmpty && nivelSelected.isEmpty) || (nivel.isNotEmpty && nivelSelected.isNotEmpty && (nivel != nivelSelected))){
          nivelSelected = nivel;
          updateFirebase = true;
        }
        if(nivel.isEmpty){
          contChange++;
        }else{
          contChange = 0;
        }
        if(contChange == 4 && nivel.isEmpty){
          nivelSelected = '';
          contChange = 0;
          updateFirebase = true;
        }
        notifyListeners();

        if(updateFirebase){
          updateStatus(status: nivelSelected);
        }
      }

    }catch(e){
      debugPrint('Error checkBeacons ${e.toString()}');
    }
  }

  Future updateStatus({required String status}) async {

    try{
      Map<String,dynamic> data = {
        'name1' : SharedPrefsLocal.schoolName1,
        'name2' : SharedPrefsLocal.schoolName2,
        'status' : status,
      };

      await FirebaseConnectionParents().edit(data: data, id: SharedPrefsLocal.schoolIdParents);

    }catch(e){
      debugPrint(e.toString());
    }

  }
}