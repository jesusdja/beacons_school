import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseConnectionConfigBeacons{

  final CollectionReference collection = FirebaseFirestore.instance.collection('beacons');

  Future<List<QueryDocumentSnapshot>> getAllAffiliates() async{
    List<QueryDocumentSnapshot> listAll = [];
    try{
      var result =  await collection.get();
      listAll = result.docs.map((QueryDocumentSnapshot e) => e).toList();
    }catch(ex){
      debugPrint(ex.toString());
    }
    return listAll;
  }

  Future<bool> createAffiliate(Map<String,dynamic> data) async {
    bool res = false;
    try{
      await collection.add(data);
      res = true;
    }catch(ex){
      debugPrint(ex.toString());
    }
    return res;
  }

  Future<bool> editAffiliate({required Map<String, dynamic> data,required String id}) async {
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

