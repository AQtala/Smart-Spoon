import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/preferences.dart';

abstract class PreferencesService {
  Preferences get();
  Future<void> set(Preferences preferences);
  Future<void> clear();
}

class MyPreferencesService implements PreferencesService {
  // ignore: constant_identifier_names
  static const PREFS_KEY = "prefs";

  final SharedPreferences _sharedPreferences;

  MyPreferencesService(this._sharedPreferences);

  @override
  get() {
    final data = _sharedPreferences.getString(PREFS_KEY);
    if (data == null) {
      return Preferences.defaultValues();
    }
    final map = Map<String, dynamic>.from(jsonDecode(data));
    return Preferences.fromJson(map);
  }

  @override
  Future<void> set(preferences) async {
    final data = jsonEncode(preferences.toJson());
    await _sharedPreferences.setString(PREFS_KEY, data);
  }

  @override
  Future<void> clear() async {
    _sharedPreferences.clear();
  }
}
