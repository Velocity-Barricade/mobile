
import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Models/parsedTimetable.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';

class RequestManager {
  static final RequestManager _singleton = new RequestManager._internal();
  Dio dio;
  StorageHandler storageHandler;

  getCourses() async {

    String url = Config.baseUrl + Config.getAllClassesRoute;
    print(url);
    Response response = await dio.get(url);
    return response.data;
  }
  getCompleteTimetable() async {
    String url = Config.baseUrl + Config.getCompleteTimetableRoute;
    Response response = await dio.get(url);
    storageHandler.setValue(Config.completeTimetableKey, json.encode(response.data));
  }

  Future <bool>getClasses({@required String email}) async {
    String url =
        Config.baseUrl + Config.getUserClassesRoute.replaceAll(":email", email);

    try {
      print(url);
      Response response = await dio.get(url);
      if(response.statusCode==404){
        return false;
      }
      else{
//        print(response.statusCode);
        storageHandler.setValue(email, json.encode(response.data));

      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  updateCourses(@required var courseList) {}

  addCourses({@required var cousreList}) {}

  addExtraClass({@required var extraClass}) {}

  factory RequestManager() {
    return _singleton;
  }

  RequestManager._internal() {
    dio = new Dio();
    storageHandler = new StorageHandler();
  }
}