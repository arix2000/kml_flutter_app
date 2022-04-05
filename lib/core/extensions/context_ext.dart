import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/app_localizations.dart';

extension ContextExt on BuildContext {

  String getString(String key) {
    return AppLocalizations.of(this).translate(key);
  }

  Color get primaryColor => Theme.of(this).primaryColor;
  Color get accentColor => Theme.of(this).accentColor;
}