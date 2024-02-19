import 'package:flutter/material.dart';
import 'package:loginpage/utility/button.dart';
import 'package:velocity_x/velocity_x.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsaved;
  VoidCallback oncancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.oncancel,
      required this.onsaved});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 125,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Create New Task",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "save", onpressed: onsaved).px4(),
                MyButton(text: "cancel", onpressed: oncancel).px4(),
              ],
            ).py20(),
          ],
        ),
      ),
    );
  }
}
