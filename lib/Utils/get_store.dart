import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Utils/request_manager.dart';

getStoreTimetable() async {
  print("hello");
  var classMap =
      await RequestManager.getClasses(email: "shakeebsiddiqui1998@gmail.com");
  print('HERE');
  StorageHandler().storeClasses(
      timeTable: classMap, email: "shakeebsiddiqui1998@gmail.com");
}

getTimetable({String email}) {
  var timetable =
      StorageHandler().getClasses(email: "shakeebsiddiqui1998@gmail.com");

  return timetable;
}
