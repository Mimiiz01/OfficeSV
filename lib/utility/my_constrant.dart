import 'package:flutter/material.dart';

class MyConstant {
  // field
  static String appName = 'Officer SV';

  static Color primary = const Color(0xff9926ad);
  static Color dark = const Color(0xff67007d);
  static Color light = const Color(0xffcd5bdf);

  //method
  BoxDecoration curBorder() => BoxDecoration(
        border: Border.all(color: MyConstant.dark),
        borderRadius: BorderRadius.circular(10),
      );

  BoxDecoration painBox() => BoxDecoration(
        color: light.withOpacity(0.3),
      );

  TextStyle h1Style() => TextStyle(
        fontSize: 30,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
