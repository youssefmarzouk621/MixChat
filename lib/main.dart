import 'package:chatup/Home/HomePage.dart';
import 'package:chatup/Storage/UsersRepository.dart';
import 'package:chatup/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      title: 'MixChat',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Color(0xff0da773),
        accentColor: Color(0xffF56D58),
        primaryColorDark: Color(0xff262833),
        primaryColorLight: Color(0xffFCF9F5),
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Color(0xff0da773),
        accentColor: Color(0xffF56D58),
        primaryColorDark: Color(0xffFFFFFF),
        primaryColorLight: Color(0xff000000),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: UsersRepository.getAllUsers(),
        builder: (context, snapshot) {
          if(snapshot.data==null){
              return Container(
                child: Center(
                    child: SpinKitDoubleBounce(
                    color: Theme.of(context).primaryColor,
                    size: 50.0,
                  )
                )
              );
          }else{
            if(snapshot.data.length==0){
              return WelcomePage();
            }else{
              return Homepage();
            }
          }
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}
