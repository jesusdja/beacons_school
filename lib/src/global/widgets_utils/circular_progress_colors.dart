import 'package:flutter/material.dart';

Widget circularProgressColors({
  double widthContainer1 = 30,
  double widthContainer2 = 20,
}) {
  return SizedBox(
    width: widthContainer1,
    child: Center(
      child: SizedBox(
          height: widthContainer2,
          width: widthContainer2,
          child: const CircularProgressIndicator()),
    ),
  );
}
