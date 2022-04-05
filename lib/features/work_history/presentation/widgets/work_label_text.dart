import 'package:flutter/material.dart';

class WorkLabelText extends StatelessWidget {
  final String text;
  
  const WorkLabelText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 14));
  }
}
