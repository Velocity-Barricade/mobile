import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Config {
  static StorageHandler storageHandler = new StorageHandler();

//  static String baseUrl = getValue("baseUrl", "http://timetablenotifier.com:3000");
  static String baseUrl = getValue("baseUrl", "http://52.200.188.3:3000");
  static String updateCourseRoute =
      getValue("updateCourseRoute", "/user/updateCourses");
  static String getUserClassesRoute =
      getValue("getUserClassesRoute", "/user/getClasses/:email");
  static String getCompleteTimetableRoute =
      getValue("getCompleteTimetableRoute", "/user/getCompleteTimetable");

//  Updated (other than default) are persisted to local sharedPreferences to
//  use those as default next time app is opened
  static String getValue(String key, String defaultValue) {
    if (storageHandler.preferences == null ||
        !storageHandler.preferences.containsKey(key)) {
      return defaultValue;
    }

    return storageHandler.preferences.getString(key);
  }

  static persistConfigToSharedPreferences() {
    storageHandler.preferences.setString("baseUrl", baseUrl);
    storageHandler.preferences
        .setString("updateCourseRoute", updateCourseRoute);
    storageHandler.preferences
        .setString("getUserClassesRoute", getUserClassesRoute);
    storageHandler.preferences
        .setString("getCompleteTimetableRoute", getCompleteTimetableRoute);
  }

  static fromJson(Map<String, RemoteConfigValue> json) {
    baseUrl = json['base_url'].asString();
    updateCourseRoute = json['update_course_route'].asString();
    getUserClassesRoute = json['get_user_classes_route'].asString();
    getCompleteTimetableRoute = json['get_complete_timetable_route'].asString();
  }

  static Map<String, dynamic> toJson() => {
        'base_url': baseUrl,
        'update_course_route': updateCourseRoute,
        'get_user_classes_route': getUserClassesRoute,
        'get_complete_timetable_route': getCompleteTimetableRoute
      };
}
