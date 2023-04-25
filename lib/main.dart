import 'package:flutter/material.dart';

import 'user_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xfff0a0e21), centerTitle: true),
        scaffoldBackgroundColor: Color(0xfff0a0e21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xffffffff)),
          bodyText2: TextStyle(color: Color(0xffffffff)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}


