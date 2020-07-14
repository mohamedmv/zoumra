
import 'package:flutter/material.dart'; 
import 'package:splashscreen/splashscreen.dart';
import 'package:zoumra/screens/homeScreen/homescreen.dart'; 

class MySplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashScreen(
        
        seconds: 6,
      
        image: Image.asset('images/image2.PNG'),
        navigateAfterSeconds: HomeScreen(),
        
        photoSize: 100.0,
        gradientBackground: LinearGradient(colors: <Color> [
               Colors.blue[500],
               Colors.blue[700],
               Colors.blue[900],
        ]),
        ),
    );
  }
}
