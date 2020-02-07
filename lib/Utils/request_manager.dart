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

  getCompletetimetable() async {
    String url= Config.baseUrl+Config.getCompleteTimetableRoute;
    Response response= await Dio().get(url);
    return response.data;
  }

  static getClasses({@required String email}) async {
    print("inside getClasses");
    String url =
        Config.baseUrl + Config.getUserClassesRoute.replaceAll(":email", email);

    try {
      print(url);
      Response response = await Dio().get(url);

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
