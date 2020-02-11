import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Config {
  static StorageHandler storageHandler = new StorageHandler();

  static String completeTimetableKey = "completeTimetable";
  static String friendsListKey = "friendsList";
  static String courseListKey = "courseList";


//  static String baseUrl = getValue("baseUrl", "http://timetablenotifier.com:3000");
  static String baseUrl = getValue("baseUrl", "http://52.200.188.3:3000");
  static String updateCourseRoute =
      getValue("updateCourseRoute", "/user/updateCourses");
  static String getUserClassesRoute =
      getValue("getUserClassesRoute", "/user/getClasses/:email");
  static String getCompleteTimetableRoute =
      getValue("getCompleteTimetableRoute", "/user/getCompleteTimetable");
  static FirebaseUser currentUser;

  static String getAllClassesRoute = getValue("getAllClassesRoute", "/course");

//  Updated (other than default) are persisted to local sharedPreferences to
//  use those as default next time app is opened
  static String getValue(String key, String defaultValue) {
    if (StorageHandler.preferences == null ||
        !StorageHandler.preferences.containsKey(key)) {
      return defaultValue;
    }

    return storageHandler.getValue(key);
  }

  static persistConfigToSharedPreferences() {
    StorageHandler.preferences.setString("baseUrl", baseUrl);
    StorageHandler.preferences
        .setString("updateCourseRoute", updateCourseRoute);
    StorageHandler.preferences
        .setString("getUserClassesRoute", getUserClassesRoute);
    StorageHandler.preferences
        .setString("getCompleteTimetableRoute", getCompleteTimetableRoute);

    StorageHandler.preferences.setString("getAllClassesRoute", getAllClassesRoute);
    storageHandler.setValue("baseUrl", baseUrl);
    storageHandler.setValue("updateCourseRoute", updateCourseRoute);
    storageHandler.setValue("getUserClassesRoute", getUserClassesRoute);
    storageHandler.setValue("getCompleteTimetableRoute", getCompleteTimetableRoute);
    storageHandler.setValue("getAllClassesRoute", getAllClassesRoute);
  }

  static fromJson(Map<String, RemoteConfigValue> json) {
    baseUrl = json['base_url'].asString();
    updateCourseRoute = json['update_course_route'].asString();
    getUserClassesRoute = json['get_user_classes_route'].asString();
    getCompleteTimetableRoute = json['get_complete_timetable_route'].asString();
    getAllClassesRoute = json['get_all_classes_route'].asString();
    persistConfigToSharedPreferences();
  }

  static Map<String, dynamic> toJson() => {
        'base_url': baseUrl,
        'update_course_route': updateCourseRoute,
        'get_user_classes_route': getUserClassesRoute,
        'get_complete_timetable_route': getCompleteTimetableRoute,
        'get_all_classes_route': getAllClassesRoute
      };
}
