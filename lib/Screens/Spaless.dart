import 'package:crizonex/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        },
        child: Stack(
          children: [
            // Background Image (Full-Screen)
            Positioned.fill(
              child: FadeIn(
                duration: Duration(seconds: 2),
                child: Image.asset(
                  "asset/images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
        

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FadeInDown(
                    duration: Duration(seconds: 2),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 40),
                        child: Image.asset(
                          "asset/images/logo__main.png",
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
