import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import './person/person.dart';

class MySharedPreferences {
  static SharedPreferences? _prefs;
  static const String userData = 'user_data';

  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<void> setUser({
    required String key,
    required Person person,
  }) async {
    String jsonString = jsonEncode(person);
    await _prefs!.setString(userData, jsonString);
  }

  static String? getJsonString(String key) => _prefs!.getString(key);

  static Person getUser(String key) {
    Map<String, dynamic> jsonMap = jsonDecode(getJsonString(key)!);
    return PersonSaveLocally.fromJson(jsonMap);
  }

  static Future<void> clearPrefs() async {
    await _prefs!.clear();
  }

  static bool exists(String keyTitle) => _prefs!.containsKey(keyTitle);
}
