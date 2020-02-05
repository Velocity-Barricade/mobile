//import 'd';
import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Models/course_class.dart';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';

class RequestManager {
  static final RequestManager _singleton = new RequestManager._internal();
  Dio dio;
//  String baseUrl = "http://";
//  String getCourse;

  getCompletetimetable() {}

  static getClasses({@required String email}) async {
    print("inside getClasses");
    String url =
        Config.baseUrl + Config.getUserClassesRoute.replaceAll(":email", email);

    try {
      print(url);
      Response response = await Dio().get(url);
//      Map<String, dynamic> parsedMap = new Map();
//
//      response.data.forEach((k, v) {
//        parsedMap[k] = v.map((title) => CourseClass.fromJson(title)).toList();
//      });
//
//      print(parsedMap);

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  updateCourses(@required var courseList) {}

  addCourses({@required var cousreList}) {}

  addExtraClass({@required var extraClass}) {}

  factory RequestManager() {
    return _singleton;
  }

  RequestManager._internal() {
    dio = new Dio();
  }
}
