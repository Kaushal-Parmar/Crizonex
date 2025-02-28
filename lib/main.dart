
import 'package:crizonex/Screens/Login.dart';
import 'package:crizonex/Screens/Second_Page.dart';
import 'package:crizonex/Screens/Spaless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen


      ),
      home: SplashScreen()
    );
  }
}

