import 'package:flutter/material.dart';
import 'package:manageapp/button_dialog.dart';

class DialogBox extends StatelessWidget {
  final controller1;
  final controller2;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a name task",
              ),
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add cost",
              ),
            ),
            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
