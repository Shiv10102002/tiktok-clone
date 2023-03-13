import 'package:flutter/material.dart';
import 'package:tictok/constraint.dart';

class TextinputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  String myLabelText;
  final bool ishide;
  TextinputField(
      {super.key,
      required this.controller,
      required this.myLabelText,
      required this.myIcon,
      this.ishide = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: ishide,
      decoration: InputDecoration(
        labelText: myLabelText,
        prefixIcon: Icon(myIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: bordercolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: bordercolor),
        ),
      ),
    );
  }
}
