import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseConnectionParents{

  final CollectionReference collection = FirebaseFirestore.instance.collection('parents');

  Future<List<QueryDocumentSnapshot>> getAll() async{
    List<QueryDocumentSnapshot> listAll = [];
    try{
      var result =  await collection.get();
      listAll = result.docs.map((QueryDocumentSnapshot e) => e).toList();
    }catch(ex){
      debugPrint(ex.toString());
    }
    return listAll;
  }

  Future<bool> create(Map<String,dynamic> data) async {
    bool res = false;
    try{
      DocumentReference result = await collection.add(data);
      SharedPrefsLocal.schoolIdParents = result.id;
      res = true;
    }catch(ex){
      debugPrint(ex.toString());
    }
    return res;
  }

  Future<bool> edit({required Map<String, dynamic> data,required String id}) async {
    bool res = false;
    try{
      await collection.doc(id).update(data);
      res = true;
    }catch(ex){
      debugPrint(ex.toString());
    }
    return res;
  }

}

