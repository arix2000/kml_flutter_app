import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/Constants.dart';
import 'package:kml_flutter_app/features/maincontainer/app_drawer.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile_page.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';

class MainContainer extends StatelessWidget {
  static final route = "MainContainerRoute";
  static int loginId = Constants.UNKNOWN_ID;
  static String fistName;
  static String lastName;

  @override
  Widget build(BuildContext context) {
    loginId = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString('app_name')),
        backgroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: ProfilePage(),
    );
  }
}
