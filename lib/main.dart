
import 'dart:io';

import 'package:crizonex/Screens/Login.dart';
import 'package:crizonex/Screens/Second_Page.dart';
import 'package:crizonex/Screens/Spaless.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid){
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyDcbAU9LjzwBQatcy-OUCUK-XyQP09sAN0',
        appId: '1:1023345130735:android:37ef5df55bf13f45596f1a',
        projectId: 'fir-fbaea',
        messagingSenderId: '',
      ),
    );
    print("firebase connected ");
  }else{
    await Firebase.initializeApp();
    print("some thing wrong");
  }
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
      // home: Demo_class(),
      home: SplashScreen()
    );
  }
}

