import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/app_localizations.dart';

extension Strings on BuildContext {
  String getString(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}