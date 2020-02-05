import 'package:firebase_remote_config/firebase_remote_config.dart';

class Config {
  static String baseUrl = "http://52.200.188.3:3000";
//  static String baseUrl = "http://timetablenotifier.com:3000";
  static String updateCourseRoute = "/user/updateCourses";
  static String getUserClassesRoute = "/user/getClasses/:email";
  static String getCompleteTimetableRoute = "/user/getCompleteTimetable";

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
