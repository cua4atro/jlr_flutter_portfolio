import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//DarkTheme Colors
Color darkPrimaryColor = const Color(0xff000033);
Color darkAppBarColor = const Color(0xFF000044);

//LightThemeColors
Color lightPrimaryColor = const Color(0xff000033);
Color lightAppBarColor = const Color(0xff8A503C);
Color activeColor = const Color(0xFF0000BB);

ThemeData lightThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: lightAppBarColor,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: GoogleFonts.roboto().fontFamily,
  cardColor: const Color(0xffE5E6EB),
  inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(), fillColor: Colors.white),
  iconTheme: IconThemeData(color: darkPrimaryColor),
  shadowColor: Colors.grey.withOpacity(0.5),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: const Color(0xff343541)),
    displayMedium: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: const Color(0xff343541)),
    displaySmall: GoogleFonts.roboto(
      fontSize: 18,
      color: const Color(0xff343541),
    ),
    bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xff1D2129)),
    bodyMedium: GoogleFonts.roboto(
      color: const Color(0xff1D2129),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.roboto(
      color: const Color(0xff343541),
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.roboto(
      color: const Color(0xff1D2129),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.roboto(
      color: const Color(0xff5E6165),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData darkThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: darkAppBarColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: darkPrimaryColor,
  scaffoldBackgroundColor: darkPrimaryColor,
  cardColor: const Color(0xFF3e3f4b),
  inputDecorationTheme:
      const InputDecorationTheme(fillColor: Color(0xFF3e3f4b)),
  iconTheme: const IconThemeData(color: Colors.white),
  shadowColor: Colors.black54.withOpacity(0.3),
);
