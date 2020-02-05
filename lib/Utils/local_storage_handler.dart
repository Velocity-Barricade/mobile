
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler{
  SharedPreferences preferences;
  static final StorageHandler _singleton = new StorageHandler._internal();
  bool isInitialized = false;
  factory StorageHandler() {
    //    SharedPreferences preferences= await SharedPreferences.getInstance();

    return _singleton;
  }

  storeClasses(){}

  getClasses(){}

  storeTimetable(){}

  getTimetable(){}

  storeFriends(){}

  getFriends(){}

  getInstance({SharedPreferences prefrences})
  {
    this.preferences=prefrences;
    this.isInitialized=true;
  }




  StorageHandler._internal() {

  }


}