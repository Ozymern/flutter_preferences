import 'package:shared_preferences/shared_preferences.dart';

class PrefsUser {
  //propiedades que almacenare
  bool _secondaryColor;
  int _gender;
  String _name;

//patron singleton

  static final PrefsUser _prefsUser = new PrefsUser._internal();

//cuando se enecute en constructor por defecto , retornara la instancia
  factory PrefsUser() {
    return _prefsUser;
  }

  PrefsUser._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET

  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  get name {
    return _prefs.getString(_name) ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? '/';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
