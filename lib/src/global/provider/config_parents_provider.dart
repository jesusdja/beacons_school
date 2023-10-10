
// ignore_for_file: use_build_context_synchronously

import 'package:beacons_school/src/global/provider/splash_provider.dart';
import 'package:beacons_school/src/global/services/firebase_connection_parents.dart';
import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/widgets_utils/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigParentsProvider extends ChangeNotifier {

  bool loadData = true;
  bool loadSave = false;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  ConfigParentsProvider(){
    initialData();
  }

  Future initialData() async{
    loadData = true; notifyListeners();

    controller1.text = SharedPrefsLocal.schoolName1;
    controller2.text = SharedPrefsLocal.schoolName2;

    loadData = false; notifyListeners();
  }

  Future saveData({required BuildContext context, bool isConfig = false}) async {

    loadSave = true; notifyListeners();

    try{
      String error = '';
      if(controller1.text.isEmpty || controller2.text.isEmpty){
        error = 'Campos requeridos';
      }

      if(error.isEmpty){

        Map<String,dynamic> data = {
          'name1' : controller1.text,
          'name2' : controller2.text,
          'status' : '',
        };
        bool result = false;
        if(isConfig){
          result = await FirebaseConnectionParents().edit(data: data, id: SharedPrefsLocal.schoolIdParents);
        }else{
          result = await FirebaseConnectionParents().create(data);
        }

        if(result){

          SharedPrefsLocal.schoolName1 = controller1.text;
          SharedPrefsLocal.schoolName2 = controller2.text;
          showAlert(text: 'GUARDADO',);

          if(isConfig){
            Navigator.of(context).pop();
          }else{
            SharedPrefsLocal.statusSplash = 4;
            SplashProvider splashProvider = Provider.of<SplashProvider>(context,listen: false);
            splashProvider.splashStatus = SplashStatus.parents;
          }
        }else{
          showAlert(text: 'Problema para enviar la informacion',isError: true);
        }

      }else{
        showAlert(text: error,isError: true);
      }

    }catch(e){
      debugPrint(e.toString());
    }

    loadSave = false; notifyListeners();

  }




}