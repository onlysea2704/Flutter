import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final VoidCallback addrevenue;
  final VoidCallback addcost;
  button({required this.addrevenue, required this.addcost});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: addrevenue,
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: addcost,
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
