import 'package:flutter/material.dart';
import 'package:flutter_project/pin_entry_screen.dart';
import 'package:flutter_project/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thrivee',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(76, 40, 116, 1),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
        });
  }
}
