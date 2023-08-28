import 'package:flutter/material.dart';

class SchoolStyles {
  TextStyle stylePrimary({
    double size = 20,
    Color? color,
    FontWeight? fontWeight,
  }) {

    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size,
      fontWeight: fontWeight,
    );
  }
}
