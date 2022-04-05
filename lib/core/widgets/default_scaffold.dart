import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';

import 'app_drawer.dart';

class DrawerScaffold extends StatelessWidget {
  final Widget body;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget floatingActionButton;

  const DrawerScaffold(
      {Key key,
      this.body,
      this.floatingActionButtonLocation,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.getString('app_name')),
        backgroundColor: Colors.black,
      ),
      drawer: AppDrawer(),
      body: body,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
    );
  }
}
