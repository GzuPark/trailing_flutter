import 'package:flutter/material.dart';
import 'package:trailing_flutter/pages/detail_page.dart';
import 'package:trailing_flutter/pages/navpages/main_page.dart';
import 'package:trailing_flutter/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WelcomePage(),
      // home: MainPage(),
      home: DetailPage(),
    );
  }
}
