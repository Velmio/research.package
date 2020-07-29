import 'package:flutter/material.dart';

Map<int, Color> velmioPallete = {
  50: Color(0xfffff6f6),
  100: Color(0xffffe8e8),
  200: Color(0xffffd9d9),
  300: Color(0xffffc9c9),
  400: Color(0xffffbebe),
  500: Color(0xffffb2b2),
  600: Color(0xffffabab),
  700: Color(0xffffa2a2),
  800: Color(0xffff9999),
  900: Color(0xffff8a8a),
};

MaterialColor velmioColor = MaterialColor(0xffff8888, velmioPallete);

ThemeData theme = ThemeData(
  // primaryColor: Color(0xffff8888),
  // accentColor: Color(0xffff8888),
  //primaryContrastingColor: Colors.white,
  //barBackgroundColor: Colors.white,
  primarySwatch: velmioColor,
  scaffoldBackgroundColor: Color(0xffF6F7F8),
  iconTheme: IconThemeData(color: velmioColor),
  // textTheme: TextTheme(
  //   // navLargeTitleTextStyle: TextStyle(
  //   //   fontFamily: 'Quicksand',
  //   //   color: Color(0xff414141),
  //   //   fontSize: 32,
  //   //   fontWeight: FontWeight.w700,
  //   //   fontStyle: FontStyle.normal,
  //   // ),
  //   // navTitleTextStyle: TextStyle(
  //   //   fontFamily: 'Quicksand',
  //   //   color: Color(0xff414141),
  //   //   fontSize: 18,
  //   //   fontWeight: FontWeight.w700,
  //   //   fontStyle: FontStyle.normal,
  //   // ),
  // )
);
