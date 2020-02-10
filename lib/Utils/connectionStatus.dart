import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream

Future<bool> checkConnectionStatus() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch(_) {
    return false;
  }
}