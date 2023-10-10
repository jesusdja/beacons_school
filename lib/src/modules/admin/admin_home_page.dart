import 'package:beacons_school/initial_page.dart';
import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
import 'package:beacons_school/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:beacons_school/src/modules/admin/config_beacons_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _ParentsHomePageState();
}

class _ParentsHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: sizeW,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: sizeH * 0.08,right: sizeW * 0.1),
            child: IconButton(
              icon: Icon(Icons.edit,color: SchoolColors.primary,size: sizeH * 0.03),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (BuildContext context) => const ConfigBeaconsPage(isConfig: true,)));
              },
            ),
          ),
          Expanded(
            child: body(),
          )
        ],
      ),
    );
  }

  Widget body(){
    return SizedBox(
      width: sizeW,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('parents').snapshots(),
        builder: (context, snapshot){
          if (snapshot.connectionState ==
              ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: circularProgressColors(),
            );
          }

          List<Widget> listW1 = [];
          List<Widget> listW2 = [];
          List<Widget> listW3 = [];
          List<Widget> listW4 = [];
          List<Widget> listW5 = [];
          List<Widget> listW = [];

          for(int x = 0; x < snapshot.data!.docs.length; x++){
            Map<String,dynamic> data = snapshot.data!.docs[x].data();
            if(data['status'] == '1'){ listW1.add(cardParent(parent: data)); }
            if(data['status'] == '2'){ listW2.add(cardParent(parent: data)); }
            if(data['status'] == '3'){ listW3.add(cardParent(parent: data)); }
            if(data['status'] == '4'){ listW4.add(cardParent(parent: data)); }
            if(data['status'] == '5'){ listW5.add(cardParent(parent: data)); }
            if(data['status'] == ''){ listW.add(cardParent(parent: data)); }
          }

          return SizedBox(
            width: sizeW,
            child: Column(
              children: [
                ...listW1,
                ...listW2,
                ...listW3,
                ...listW4,
                ...listW5,
                ...listW
              ],
            ),
          );
        }
      ),
    );
  }

  Widget cardParent({required Map<String,dynamic> parent}){

    TextStyle style1 = SchoolStyles().stylePrimary(size: sizeH * 0.02,color: Colors.black,fontWeight: FontWeight.bold);
    TextStyle style2 = SchoolStyles().stylePrimary(size: sizeH * 0.02,color: Colors.black);

    String status = 'Fuera de rango';
    if(parent['status'].toString().isNotEmpty){
      status = 'Nivel ${parent['status']}';
    }

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      padding: EdgeInsets.symmetric(horizontal: sizeW * 0.02,vertical: sizeH * 0.02),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Padre : ${parent['name1']}',style: style1,textAlign: TextAlign.right),
                Text('Hij@ : ${parent['name2']}',style: style1,textAlign: TextAlign.right),
              ],
            ),
          ),
          SizedBox(
            width: sizeW * 0.3,
            child: Text(status,textAlign: TextAlign.center,style: style2),
          )
        ],
      ),
    );
  }
}
