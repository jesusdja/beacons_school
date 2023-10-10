import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(text),
      ),
    );
  }
}
