import 'package:flutter/material.dart';
import 'package:manageapp/tile.dart';

class listtile extends StatelessWidget {
  final List listTilerevenue;
  final List listTilecost;
  Function(int) deletecost;
  Function(int) deleterevenue;
  listtile(
      {required this.listTilecost,
      required this.listTilerevenue,
      required this.deletecost,
      required this.deleterevenue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: listTilerevenue.length,
              itemBuilder: (context, index) {
                return tile1(
                  task: listTilerevenue[index][0],
                  cost: listTilerevenue[index][1],
                  deleteFunction: (context) => deleterevenue(index),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listTilecost.length,
              itemBuilder: (context, index) {
                return tile2(
                  task: listTilecost[index][0],
                  cost: listTilecost[index][1],
                  deleteFunction: (context) => deletecost(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
