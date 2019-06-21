import 'package:flutter/material.dart';
import 'package:flutter_preferences/src/share_prefs/prefs_user.dart';
import 'package:flutter_preferences/src/widget/drawer_menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _gender;
  String _name;

  TextEditingController _textEditingController;
  final prefsUser = new PrefsUser();

  @override
  void initState() {
    super.initState();
    prefsUser.lastPage = 'settings';
    _gender = prefsUser.gender;
    _secondaryColor = prefsUser.secondaryColor;
    _name = prefsUser.name;
    _textEditingController = new TextEditingController(text: prefsUser.name);
  }

  _selectRadio(int value) {
    //guardo un entero
    prefsUser.gender = value;
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('preferencias de Usuarios'),
          backgroundColor:
              (prefsUser.secondaryColor) ? Colors.purpleAccent : Colors.red,
        ),
        drawer: DrawerMenu(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'settings',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('color segundario'),
              onChanged: (x) {
                setState(() {
                  _secondaryColor = x;
                  prefsUser.secondaryColor = x;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              //groupValue identificacion que le dice a flutter que estos 2 radios estan relacionados
              groupValue: _gender,
              //no es necesario poner ningun argumento porque lo que sea que emita el onChange se pasara como argumento al _selectRadio
              onChanged: _selectRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              //groupValue identificacion que le dice a flutter que estos 2 radios estan relacionados
              groupValue: _gender,
              onChanged: _selectRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'ingrese su Nombre'),
                onChanged: (x) {
                  setState(() {
                    _name = x;
                    prefsUser.name = x;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
//?? -> si esta operacion es da un nulo se le asignara un cero y a ese cero se le sumara un 1
