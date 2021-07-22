import 'package:flutter/material.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile_page.dart';

import 'app_drawer_header.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(padding: EdgeInsets.zero, child: AppDrawerHeader()),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ProfilePage.route);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Dodawanie godzin"),
            onTap: () {
              Navigator.pop(context);
              //navigate to work adding
            },
          ),
          Divider(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Historia Zadań",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.self_improvement_rounded),
            title: Text("Dziennik Indywidualny"),
            onTap: () {
              Navigator.pop(context);
              //navigate to work history with WORK tag
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Dziennik Ogólny"),
            onTap: () {
              Navigator.pop(context);
              //navigate to work history with MEETINGS tag
            },
          )
        ],
      ),
    );
  }
}
