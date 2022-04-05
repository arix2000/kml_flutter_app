import 'dart:ui';

import 'Constants.dart';

abstract class Globals {
  static int loginId = Constants.UNKNOWN_ID;
  static String fistName;
  static String lastName;
}

abstract class AppColors {
  static Color cardBackground = Color.fromARGB(255, 61, 61, 61);
}