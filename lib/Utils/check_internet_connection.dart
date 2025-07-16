

import 'dart:io';

Future<bool> checkInternet() async {
  bool ActiveConnection = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      ActiveConnection = true;
    } else {
      ActiveConnection = false;
    }
    return ActiveConnection;
  } catch (err) {
  }
  return ActiveConnection;
}