// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes {
  static final lightTheme = ThemeData(
      primarySwatch:Colors.orange, // changes all colours with respect to given colour
      canvasColor: Color.fromRGBO(244, 244, 244, 1),
      highlightColor: Colors.white, //secondary background colour
      cardColor: Color.fromRGBO(251, 147, 0, 1),
      focusColor: Color.fromRGBO(255, 178, 0, 1),
      splashColor: Color.fromARGB(255, 134, 132, 132),
      
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(244, 244, 244, 1),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orange, size: 28),
      ),
      // pageTransitionsTheme: PageTransitionsTheme(
      //     builders: {
      //       TargetPlatform.android: ZoomPageTransitionsBuilder(),
      //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //     },
      //   ),
    );

  // static final darkTheme = ThemeData(
  //     primarySwatch: Colors.deepOrange,
  //     canvasColor: Color.fromRGBO(243,229,245, 1),
  //     cardColor: Color.fromRGBO(116, 255, 172, 1),
  //     appBarTheme: AppBarTheme(
  //         color: Colors.black,
  //         elevation: 0.0,
  //         iconTheme: IconThemeData(color: Colors.red)
  //     )
  //   );
}