import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> alertDialog(BuildContext context) async {
  Size size = MediaQuery.of(context).size;
  bool res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(''),
          content: Text('¿Estas seguro que quieres cerrar la sesión?',
            textAlign: TextAlign.center,
            style: SchoolStyles().stylePrimary(
                size: size.height * 0.025, color: SchoolColors.primary),),
          actions: <Widget>[
            CupertinoButton(
              child: Text('SI',
                style: SchoolStyles().stylePrimary(size: size.height * 0.02,
                    color: SchoolColors.primary,
                    fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.02,),
            CupertinoButton(
              child: Text('NO',
                style: SchoolStyles().stylePrimary(size: size.height * 0.02,
                    color: SchoolColors.primary,
                    fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      }
  );
  return res;
}