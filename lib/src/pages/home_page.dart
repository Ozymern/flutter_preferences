import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/share_prefs/prefs_user.dart';
import 'package:flutter_preferences/src/widget/drawer_menu.dart';

class HomePage extends StatelessWidget {
  final prefsUser = new PrefsUser();
  @override
  Widget build(BuildContext context) {
    prefsUser.lastPage = '/';
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferencias de Usuarios'),
          backgroundColor:
              (prefsUser.secondaryColor) ? Colors.purpleAccent : Colors.red,
        ),
        drawer: DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color secundario  ${prefsUser.secondaryColor}'),
            Divider(),
            Text('Género ${prefsUser.gender}'),
            Divider(),
            Text('Nombre usuario ${prefsUser.name}'),
            Divider(),
          ],
        ));
  }
}
