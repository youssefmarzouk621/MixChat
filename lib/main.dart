import 'package:chatup/Statics/Statics.dart';
import 'package:chatup/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Color(0xff435de6),
        accentColor: Color(0xffF56D58),
        primaryColorDark: Color(0xff262833),
        primaryColorLight: Color(0xffFCF9F5),
      ),
      darkTheme: ThemeData(
        // This changes font for the entire app using the Google Fonts package
        // from pub.dev : https://pub.dev/packages/google_fonts
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        // You can change theme colors to directly change colors for the whole
        // app.
        primaryColor: Color(0xff435de6),
        accentColor: Color(0xffF56D58),
        primaryColorDark: Color(0xffFFFFFF),
        primaryColorLight: Color(0xff000000),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
