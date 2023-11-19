import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class tile1 extends StatelessWidget {
  final String task;
  final int cost;
  Function(BuildContext)? deleteFunction;
  tile1({required this.task, required this.cost, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Slidable(
          //startActionPane: ActionPane(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    task,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: Text(
                    cost.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class tile2 extends StatelessWidget {
  final String task;
  final int cost;
  //Function(BuildContext)? deleteFunction;
  Function(BuildContext)? deleteFunction;
  tile2({required this.task, required this.cost, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    task,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: Text(
                    cost.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
