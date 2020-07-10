import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoumra/screens/homescreen/homescreen.dart';
import 'package:zoumra/screens/infoScreen/infoScreen.dart';
import 'package:zoumra/screens/settings/settigs.dart';
import 'package:zoumra/screens/sign-inScreen/sign-in.dart';
import 'package:zoumra/shared/theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Mytheme>(

          create: (BuildContext context) => Mytheme(),
          child: MatirialAppWithTheme(),
    );
  }
}

class MatirialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mytheme = Provider.of<Mytheme>(context);
    bool thetheme = mytheme.theTheme ?? true;
    return MaterialApp(
        theme: thetheme ?  ThemeData.light(): ThemeData.dark() ,
        home: HomeScreen(),
        routes: {
    '/home' : (context) => HomeScreen(),
    '/signin': (context) => SignIn(),
    '/info': (context) => InfoScreen(),
    '/settings': (context) => Settings(),
        },
      );
  }
}










  