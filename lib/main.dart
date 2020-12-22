import 'package:clover_ag/Homepage.dart';
import 'package:clover_ag/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: CommonColors.text1,
            ),
            headline3: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CommonColors.text2,
            ),
            bodyText1: TextStyle(
              fontSize: 12,
              color: CommonColors.text1,
            ),
            bodyText2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: CommonColors.text2,
            ),
            caption: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            button: TextStyle(
              color: CommonColors.primaryColor,
              fontSize: 17,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: CommonColors.textHint,
          ))),
      home: Homepage(),
    );
  }
}
