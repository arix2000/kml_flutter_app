
import 'package:flutter/material.dart';

class TextSnackBar {
  final BuildContext context;

  TextSnackBar(this.context);

  void show(String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        content: Text(text, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        margin: EdgeInsets.all(10.0),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

}