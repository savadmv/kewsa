// ignore_for_file: public_member_api_docs

import 'package:kewsa/imports_bindings.dart';

///* Store this application using styles
@immutable
abstract class AppStyles {
  static TextStyle get text11Px => const TextStyle(fontSize: 11, fontFamily: 'PlayfairDisplay');
  static TextStyle get text16Px => const TextStyle(fontSize: 16, fontFamily: 'PlayfairDisplay');
  static TextStyle get text12Px => const TextStyle(fontSize: 12, fontFamily: 'PlayfairDisplay');
  static TextStyle get text8Px => const TextStyle(fontSize: 8, fontFamily: 'PlayfairDisplay');
  static TextStyle get text9Px => const TextStyle(fontSize: 9, fontFamily: 'PlayfairDisplay');
  static TextStyle get text10Px => const TextStyle(fontSize: 10, fontFamily: 'PlayfairDisplay');
  static TextStyle get text14Px => const TextStyle(fontSize: 14, fontFamily: 'PlayfairDisplay');
  static TextStyle get text20Px => const TextStyle(fontSize: 20, fontFamily: 'PlayfairDisplay');
  static TextStyle get text18Px => const TextStyle(fontSize: 18, fontFamily: 'PlayfairDisplay');
  static TextStyle get text13Px => const TextStyle(fontSize: 13, fontFamily: 'PlayfairDisplay');
  static TextStyle get text15Px => const TextStyle(fontSize: 15, fontFamily: 'PlayfairDisplay');
  static TextStyle get text22Px => const TextStyle(fontSize: 22, fontFamily: 'PlayfairDisplay');
  static TextStyle get text19px => const TextStyle(fontSize: 19.826086044311523, fontFamily: 'PlayfairDisplay');
  static TextStyle get text24Px => const TextStyle(fontSize: 24, fontFamily: 'PlayfairDisplay');
  static TextStyle get text17Px => const TextStyle(fontSize: 17, fontFamily: 'PlayfairDisplay');
  static TextStyle get text6 => const TextStyle(fontSize: 6.866980075836182, fontFamily: 'PlayfairDisplay');
  static TextStyle get text32Px => const TextStyle(fontSize: 32, fontFamily: 'PlayfairDisplay');
  static TextStyle get text30Px => const TextStyle(fontSize: 30, fontFamily: 'PlayfairDisplay');

  ///* Calculate line height of text
  static double calculateHeight(double height, double fontSize) {
    return height / fontSize;
  }

  ///* Calculate letter spacing of text
  static double calculateSpacing(double em) {
    return 16 * em;
  }
}
