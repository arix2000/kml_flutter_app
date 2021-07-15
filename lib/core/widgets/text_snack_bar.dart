
import 'package:flutter/material.dart';

class TextSnackBar {
  final BuildContext context;

  TextSnackBar(this.context);

  void show(String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

}