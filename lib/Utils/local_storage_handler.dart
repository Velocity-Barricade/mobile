import 'dart:convert';

import 'package:barricade/Models/parsedTimetable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  SharedPreferences preferences;
  static final StorageHandler _singleton = new StorageHandler._internal();

  factory StorageHandler() {
    return _singleton;
  }

  setValue(String key, String value) {
    this.preferences.setString(key, value);
  }

  String getValue(String key) {
//    todo: do keyerror handling here
    return this.preferences.getString(key);
  }

  ParsedTimetable getParsedTimetable(String email) {
    Map<String, dynamic> timetable = json.decode(this.getValue(email));
    return ParsedTimetable.fromJson(timetable);
  }

  bool containsKey(String key) {
    return preferences.containsKey(key);
  }

  getInstance({SharedPreferences preferences}) {
    this.preferences = preferences;
  }

  StorageHandler._internal() {}
}
