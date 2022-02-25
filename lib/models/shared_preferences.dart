
import 'dart:html';
import 'package:shared_preferences_web/shared_preferences_web.dart'

class SharedPreferences {

  //

  SharedPreferences._internal();

  //

  static final SharedPreferences instance = SharedPreferences._internal();

  final _sharedPreferences = <String, String>{};

  Future initialize() {
    return _readPreferencesFromFile();
  }

  void set({required Object value, required String key}) {
    _sharedPreferences[key] = value.toString();
    _savePreferencesToFile();
  }

  Object? get({required String key}) {
    return _sharedPreferences[key];
  }

  Future _readPreferencesFromFile() async {
    window.localStorage.entries.map((e) {
      _sharedPreferences[e.key] = e.value;
    });
  }

  void _savePreferencesToFile() async {
    window.localStorage.addAll(_sharedPreferences);
  }
}