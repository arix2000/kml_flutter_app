import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const AppButton({Key key, this.buttonText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(buttonText, style: TextStyle(color: Colors.white)),
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
