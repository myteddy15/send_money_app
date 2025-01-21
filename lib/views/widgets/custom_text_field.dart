import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({super.key, 
    required this.labelText, 
    required this.controller, 
    this.obscureText, 
    this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder().copyWith(
          borderSide: const BorderSide(width: 1.0)
        )
      ),
    );
  }
}