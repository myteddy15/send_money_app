import 'package:flutter/material.dart';

class CustomElavatedButton extends StatelessWidget {
  final int height;
  final Widget? icon;
  final VoidCallback? callback;
  final String labelText;

  const CustomElavatedButton({super.key, required this.height, this.icon, required this.callback, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton.icon(
        icon: icon ?? const SizedBox.shrink(),
        onPressed: callback,
        label: Text(
          labelText,
          style: const TextStyle().copyWith(
            fontSize: 16
          ),
        ),
      ),
    );
  }
}