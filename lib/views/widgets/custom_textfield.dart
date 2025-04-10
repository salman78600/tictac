import 'package:flutter/material.dart';
import 'package:tictac/core/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool? isReadOnly;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly!,
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
