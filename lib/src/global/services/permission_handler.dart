import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerClass{

  Future<bool> permissionBluetoothConnect() async {
    bool result = true;
    var status = await Permission.bluetoothConnect.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.bluetoothConnect.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionBluetoothScan() async {
    bool result = true;
    var status = await Permission.bluetoothScan.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.bluetoothScan.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionBluetoothAdvertise() async {
    bool result = true;
    var status = await Permission.bluetoothAdvertise.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.bluetoothAdvertise.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionBluetooth() async {
    bool result = true;
    var status = await Permission.bluetooth.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.bluetooth.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionCamera() async {
    bool result = true;
    var status = await Permission.camera.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.camera.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionMicrophone() async {
    bool result = true;
    var status = await Permission.microphone.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.microphone.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

}

