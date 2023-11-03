import 'package:flutter/material.dart';
import 'package:manageapp/ManagePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManagePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
