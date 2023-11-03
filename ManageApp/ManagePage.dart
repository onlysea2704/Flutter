import 'package:flutter/material.dart';
import 'package:manageapp/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manageapp/listtile.dart';
import 'package:manageapp/button.dart';
import 'package:manageapp/dialog_box.dart';
import 'package:manageapp/cate_total.dart';
import 'package:manageapp/drawer.dart';

class ManagePage extends StatefulWidget {
  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _myBox = Hive.box('mybox');
  DataBase db = DataBase();

  @override
  void initState() {
    if (_myBox.get("totalrevenue") == null)
      db.initialdata();
    else
      db.loadData();
  }

  void createnew(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller1: _controller1,
          controller2: _controller2,
          onSave: () => addall(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void addall(int index) {
    setState(() {
      if (index == 1) {
        db.listTilerevenue
            .add([_controller1.text, int.tryParse(_controller2.text)]);
        db.totalrevenue += int.tryParse(_controller2.text) ?? 0;
      } else {
        db.listTilecost
            .add([_controller1.text, int.tryParse(_controller2.text)]);
        db.totalcost += int.tryParse(_controller2.text) ?? 0;
      }
      _controller1.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // void createnewrevenue() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogBox(
  //         controller1: _controller1,
  //         controller2: _controller2,
  //         onSave: addrevenue,
  //         onCancel: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }

  // void createnewcost() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogBox(
  //         controller1: _controller1,
  //         controller2: _controller2,
  //         onSave: addcost,
  //         onCancel: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }
  // void addrevenue() {
  //   setState(() {
  //     db.listTilerevenue
  //         .add([_controller1.text, int.tryParse(_controller2.text)]);
  //     _controller1.clear();
  //     _controller2.clear();
  //   });
  //   Navigator.of(context).pop();
  //   db.updateData();
  // }

  // void addcost() {
  //   setState(() {
  //     db.listTilecost.add([_controller1.text, int.tryParse(_controller2.text)]);
  //     _controller1.clear();
  //     _controller2.clear();
  //   });
  //   Navigator.of(context).pop();
  //   db.updateData();
  // }

  void deleterevenue(int index) {
    setState(() {
      int _tmp = db.listTilerevenue[index]
          [1]; // phải khai báo _tmp vì nó méo cho trừ trực tiếp :)
      db.totalrevenue -= _tmp;
      db.listTilerevenue.removeAt(index);
    });
    db.updateData();
  }

  void deletecost(int index) {
    setState(() {
      int _tmp = db.listTilecost[index][1];
      db.totalcost -= _tmp;
      db.listTilecost.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Manage App'),
          ),
        ),
        drawer: Drawerr(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: category(),
              flex: 1,
            ),
            Expanded(
              child: listtile(
                listTilecost: db.listTilecost,
                listTilerevenue: db.listTilerevenue,
                deletecost: (index) => deletecost(index),
                deleterevenue: (index) => deleterevenue(index),
              ),
              flex: 10,
            ),
            Expanded(
              child: total(
                cost: db.totalcost,
                revenue: db.totalrevenue,
              ),
              flex: 1,
            ),
            Expanded(
              child:
                  // Cách 1
                  //button(addrevenue:createnewrevenue, addcost: createnewcost),
                  // Cách 2
                  button(
                      addrevenue: () => createnew(1),
                      addcost: () => createnew(2)),
              flex: 1,
            ),
          ],
        ));
  }
}
