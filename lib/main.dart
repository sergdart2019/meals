import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/view_home.dart';

void main() {
  Color mainColor = Colors.deepOrange;
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: mainColor));
  runApp(MyApp(mainColor));
}

class MyApp extends StatelessWidget {
  final Color mainColor;

  MyApp(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor
      ),
      home: ViewHome(),
    );
  }
}
