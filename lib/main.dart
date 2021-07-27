import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kml_flutter_app/core/app_localizations.dart';
import 'package:kml_flutter_app/core/dependency_injection.dart' as di;
import 'package:kml_flutter_app/features/maincontainer/main_container.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile_page.dart';

import 'features/login/presentation/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kml app',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color.fromARGB(255, 63, 95, 190),
          accentColor: Color.fromARGB(255, 63, 95, 190)),
      supportedLocales: [const Locale('pl', 'PL')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        ProfilePage.route: (context) => ProfilePage(),
        MainContainer.route: (context) => MainContainer()
      },
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      home: LoginPage(),
    );
  }
}
