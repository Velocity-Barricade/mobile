import 'dart:convert';

import 'package:barricade/Models/course_class.dart';

class ParsedTimetable {
  Map<String, List<CourseClass>> timetable;

  ParsedTimetable(Map<String, List<CourseClass>> parsedTimetable) {
    this.timetable = parsedTimetable;
  }

  factory ParsedTimetable.fromJson(Map<String, dynamic> ttJson) {
    Map<String, List<CourseClass>> parsedMap = {};
    [0, 1, 2, 3, 4, 5, 6].forEach((v) => parsedMap[v.toString()] = []);

    ttJson.forEach((k, v) {
      parsedMap[k] = v.map((title) => CourseClass.fromJson(title)).toList().cast<CourseClass>();
    });

    return ParsedTimetable(parsedMap);
  }

  List<CourseClass> getDayTimetable(int day) {
    return timetable[day.toString()];
  }

  CourseClass getUpcomingClass() {
    DateTime now = new DateTime.now();

    for (int i = 0; i < 7; i++) {
      int dayInt = ((now.weekday - 1) + i) % 7;
      String day = dayInt.toString();

      for (int courseClassIdx = 0; courseClassIdx < timetable[day].length; courseClassIdx++) {
//      Checking same day classes
        if (i == 0) {
          int startTimeHour =
          int.parse(timetable[day][courseClassIdx].time.split("-")[0].split(":")[0]);
          if (startTimeHour > now.hour) return timetable[day][courseClassIdx];
        } else {
//        Return the first class found
          return timetable[day][courseClassIdx];
        }
      }
    }

//  No courseClass exist
    return null;
  }

}