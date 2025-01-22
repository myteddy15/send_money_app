import 'package:flutter/material.dart';
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';

class ModalSheet {
  void showbottomModalSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28))),
      builder: (BuildContext context) {
        return Container(
          height: 180,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: const TextStyle().copyWith(
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 120,
                  child: CustomElavatedButton(
                    height: 50,
                    labelText: "Close",
                    callback: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}