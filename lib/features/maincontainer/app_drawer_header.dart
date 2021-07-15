import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.bottomLeft,
      color: Colors.black38,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage("resources/icon_logo.png"),
              width: 80,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
