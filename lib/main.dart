import 'package:flutter/material.dart';
import 'package:zoumra/screens/homescreen/homescreen.dart';
import 'package:zoumra/screens/infoScreen/infoScreen.dart';
import 'package:zoumra/screens/sign-inScreen/sign-in.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      '/home' : (context) => HomeScreen(),
      '/signin': (context) => SignIn(),
      '/info': (context) => InfoScreen(),
    },
  ));
}


  