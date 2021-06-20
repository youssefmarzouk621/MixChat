import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

String baseURL = "10.0.2.2:3000"; //10.0.2.2:3000
String baseUploadsURL = "http://10.0.2.2:3000/uploads/";//ressources route

DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");
DateFormat groupFormat = DateFormat("dd/MM/yyyy");
DateFormat timeFormat = DateFormat("HH:mm");

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

