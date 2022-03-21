import 'package:dianour2/Screen/instagram.dart';
import 'package:dianour2/Screen/intropage.dart';
import 'package:dianour2/Screen/facebook.dart';
import 'package:dianour2/Screen/homepage2.dart';
import 'package:dianour2/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: IntroPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          IntroPage.rotName: (ctx) => IntroPage(),
          HomePage2.routName: (ctx) => HomePage2(),
        });
  }
}
