import 'package:flutter/material.dart';
class TextinputField extends StatelessWidget {
  const TextinputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.
        )),
      ),
    );
  }
}