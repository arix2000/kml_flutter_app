import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.bottomLeft,
      color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image(
              image: AssetImage("resources/icon_logo.png"),
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(height: 12),
          Text(
            context.getString('app_name'),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            context.getString('drawer_header_email'),
            style: TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }
}
