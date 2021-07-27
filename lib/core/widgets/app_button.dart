import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color textColor;

  AppButton({Key key, @required this.buttonText, this.onPressed, this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(buttonText, style: TextStyle(color: textColor)),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                )
            ),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor)
        ),
        onPressed: onPressed);
  }
}
