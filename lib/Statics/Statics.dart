import 'package:intl/intl.dart';

String baseURL = "10.0.2.2:3000"; //10.0.2.2:3000
String baseUploadsURL = "http://10.0.2.2:3000/uploads/";//ressources route

DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");
DateFormat groupFormat = DateFormat("dd/MM/yyyy");
DateFormat timeFormat = DateFormat("HH:mm");


void logLongString(String s) {
  if (s == null || s.length <= 0) return;
  const int n = 1000;
  int startIndex = 0;
  int endIndex = n;
  while (startIndex < s.length) {
    if (endIndex > s.length) endIndex = s.length;
    print(s.substring(startIndex, endIndex));
    startIndex += n;
    endIndex = startIndex + n;
  }
}

