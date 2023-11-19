import 'package:flutter/material.dart';

class ClickMeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go Back Home Page"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
