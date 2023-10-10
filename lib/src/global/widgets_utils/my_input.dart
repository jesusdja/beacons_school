import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    required this.hintext,
    required this.label,
    super.key,
  });

  final String hintext;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintext, label: Text(label)),
    );
  }
}
