import 'package:flutter/material.dart';
import 'package:manageapp/chart.dart';

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                "OnlySea",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("Hai.PD210309@sis.hust.edu.vn"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "O",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(' Chart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClickMeRoute()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
