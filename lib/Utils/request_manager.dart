import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Models/course.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';

class RequestManager {
  static final RequestManager _singleton = new RequestManager._internal();
  Dio dio;
  StorageHandler storageHandler;

  getCompleteTimetable() async {
    String url = Config.baseUrl + Config.getCompleteTimetableRoute;
    Response response = await dio.get(url);
    storageHandler.setValue(
        Config.completeTimetableKey, json.encode(response.data));
  }

  getUserClasses({@required String email}) async {
    String url =
        Config.baseUrl + Config.getUserClassesRoute.replaceAll(":email", email);
    Response response = await dio.get(url);
    storageHandler.setValue(email, json.encode(response.data));
  }

  getAllCourses() async {
    String url = Config.baseUrl + Config.getAllCoursesRoute;
    Response response = await dio.get(url);
    storageHandler.setValue(
        Config.allCoursesKey, json.encode(response.data));
  }

  updateCourses(String uid, List<Course> coursesList) {
    String url = Config.baseUrl + Config.updateCourseRoute;

  }

  factory RequestManager() {
    return _singleton;
  }

  RequestManager._internal() {
    dio = new Dio();
    storageHandler = new StorageHandler();
  }
}
