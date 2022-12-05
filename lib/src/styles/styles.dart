import 'package:flutter/material.dart';

class Styles {
  static const Color colorBackground = Color(0xffF9F9F9);

  static const Color colorWhite = Color(0xffffffff);

  static const Color colorBlack50 = Color(0xffE6E6E6);
  static const Color colorBlack100 = Color(0xffB0B0B0);
  static const Color colorBlack200 = Color(0xff8A8A8A);
  static const Color colorBlack300 = Color(0xff545454);
  static const Color colorBlack400 = Color(0xff333333);
  static const Color colorBlack500 = Color(0xff000000);
  static const Color colorBlack600 = Color(0xff000000);
  static const Color colorBlack700 = Color(0xff000000);
  static const Color colorBlack800 = Color(0xff000000);
  static const Color colorBlack900 = Color(0xff000000);

  static const Color colorGreen50 = Color(0xffF5F9F5);
  static const Color colorGreen100 = Color(0xffE0ECE0);
  static const Color colorGreen200 = Color(0xffD1E3D1);
  static const Color colorGreen300 = Color(0xffBDD6BC);
  static const Color colorGreen400 = Color(0xffB0CEAF);
  static const Color colorGreen500 = Color(0xff9CC29B);
  static const Color colorGreen600 = Color(0xff8EB18D);
  static const Color colorGreen700 = Color(0xff6F8A6E);
  static const Color colorGreen800 = Color(0xff566B55);
  static const Color colorGreen900 = Color(0xff425141);

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: colorGreen500,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 10,
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(36),
    ),
  );

  static ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: colorGreen500,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 10,
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(36),
    ),
    side: const BorderSide(
      width: 1,
      color: colorGreen900,
    ),
  );

  static ButtonStyle whiteButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: colorBlack400,
    elevation: 3,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 10,
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(36),
    ),
  );

  static InputDecoration textFieldAuth = InputDecoration(
    labelStyle: const TextStyle(color: Styles.colorBlack200),
    errorStyle: const TextStyle(color: Colors.red),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 15.5,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99),
      borderSide: const BorderSide(color: Styles.colorBlack100),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99),
      borderSide: const BorderSide(color: Styles.colorGreen900),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );
}
