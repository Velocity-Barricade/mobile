//import 'd';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';

class RequestManager{
  static final RequestManager _singleton = new RequestManager._internal();

  String baseUrl = "http://";
  String getCourse;

  getCompletetimetable(){}

  getClasses({@required String email}){}

  updateCourses(@required var courseList){}

  addCourses({@required var cousreList}){}

  addExtraClass({@required var extraClass}){}


  factory RequestManager() {
    return _singleton;
  }

  RequestManager._internal() {
    Dio dio= Dio();

  }

}
