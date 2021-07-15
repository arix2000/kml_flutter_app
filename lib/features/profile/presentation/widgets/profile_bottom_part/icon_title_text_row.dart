
import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/Constants.dart';

class IconTitleTextRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const IconTitleTextRow(
      {Key key, @required this.icon, @required this.title, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 11, top: 11, bottom: 11, right: 8),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 11),
          Text(title + Constants.COLON, style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text(text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
