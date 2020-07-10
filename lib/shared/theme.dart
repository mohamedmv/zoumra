import 'package:flutter/material.dart';

class Mytheme  with ChangeNotifier{
  bool _theTheme;
 bool get theTheme{
   return _theTheme;
 }
 
 void changetodark(){
  _theTheme = false;
  notifyListeners();
 }
 void changetolight(){
   
   _theTheme = true;
    notifyListeners();
 }
}