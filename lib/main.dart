import 'package:flutter/material.dart';
import 'screen1.dart';
import 'package:ss_test/Screen2.dart';
import 'screen3.dart';
// @dart=2.9
import 'constants.dart';

void main() {
  runApp(const Drag_Drop());
  
}
class Drag_Drop extends StatelessWidget {
  const Drag_Drop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: appbody_color,
        appBarTheme: AppBarTheme(
          backgroundColor: appbar_color,
          centerTitle: true,
          titleTextStyle: Label_text,

        ),

      ) ,
      initialRoute: '/',
      routes: {
        '/': (context) => Screen1(),
        '/second': (context) => Screen2(),

      },

    );
  }
}


