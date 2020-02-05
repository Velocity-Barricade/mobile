class Config {
  static String baseUrl = "https://timetablenotifier.com:3000";
  static String updateCourseRoute = "/user/updateCourses";
  static String getUserClassesRoute = "/user/getClasses/:email";
  static String getCompleteTimetableRoute = "/user/getCompleteTimetable";

  static fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'].toString();
    updateCourseRoute = json['update_course_route'].toString();
    getUserClassesRoute = json['get_user_classes_route'].toString();
    getCompleteTimetableRoute = json['get_complete_timetable_route'].toString();
  }

  static Map<String, dynamic> toJson() => {
        'base_url': baseUrl,
        'update_course_route': updateCourseRoute,
        'get_user_classes_route': getUserClassesRoute,
        'get_complete_timetable_route': getCompleteTimetableRoute
      };
}
