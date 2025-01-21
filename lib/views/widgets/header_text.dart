import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle().copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.75)
      ),
    );
  }
}