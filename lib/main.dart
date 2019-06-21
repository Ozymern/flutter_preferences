import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/pages/home_page.dart';
import 'package:flutter_preferences/src/pages/settings_page.dart';
import 'package:flutter_preferences/src/share_prefs/prefs_user.dart';

void main() async {
  final prefsUser = new PrefsUser();
  await prefsUser.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefsUser = new PrefsUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //ultima pagina abierta
      initialRoute: prefsUser.lastPage,
      routes: {
        '/': (BuildContext context) => HomePage(),
        'settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
