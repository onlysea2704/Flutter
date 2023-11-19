import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  List listTilerevenue = [];
  List listTilecost = [];
  int totalrevenue = 0;
  int totalcost = 0;

  void initialdata() {
    listTilerevenue.add(['Enter Income', 0]);
    listTilecost.add(['Enter Outcome', 0]);
    totalrevenue = 0;
    totalcost = 0;
  }

  final _mybox = Hive.box('mybox');
  void loadData() {
    listTilerevenue = _mybox.get("listTilerevenue");
    listTilecost = _mybox.get("listTilecost");
    totalrevenue = _mybox.get("totalrevenue");
    totalcost = _mybox.get("totalcost");
  }

  void updateData() {
    _mybox.put("listTilerevenue", listTilerevenue);
    _mybox.put("listTilecost", listTilecost);
    _mybox.put("totalrevenue", totalrevenue);
    _mybox.put("totalcost", totalcost);
  }
}
