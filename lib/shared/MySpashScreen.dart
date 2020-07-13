
import 'package:flutter/material.dart'; 
import 'package:splashscreen/splashscreen.dart';
import 'package:zoumra/screens/homeScreen/homescreen.dart'; 

class MySplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashScreen(
        
        seconds: 10,
        backgroundColor: Colors.white,
        image: Image.asset('images/mysplash.gif'),
        navigateAfterSeconds: HomeScreen(),
        loaderColor: Colors.red,
        photoSize: 170.0,
        ),
    );
  }
}