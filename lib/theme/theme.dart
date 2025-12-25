import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color primaryColor = Color(0xFF1E88E5);
const Color secondaryColor = Color(0xFF81D4FA);
const Color accentColor = Color(0xFFB3E5FC);
const Color white = Color(0xFFFFFFFF);
const Color lightGray = Color(0xFFF5F7FA);
const Color darkGray = Color(0xFF1F2933);
const Color mediumGray = Color(0xFF6B7280);
const Color borderGray = Color(0xFFE5E7EB);

// Typography
TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
  displayMedium: GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  ),
  displaySmall: GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.4,
  ),
  headlineMedium: GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  ),
  headlineSmall: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  titleLarge: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  bodyLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  labelLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
  ),
);

// ThemeData
ThemeData learnifyTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: white,
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: white,
      textStyle: textTheme.labelLarge,
      minimumSize: Size(double.infinity, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: BorderSide(color: primaryColor),
      textStyle: textTheme.labelLarge,
      minimumSize: Size(double.infinity, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryColor,
      textStyle: textTheme.labelLarge,
      minimumSize: Size(double.infinity, 48),
      padding: EdgeInsets.symmetric(horizontal: 16),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderGray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: secondaryColor),
    ),
    contentPadding: EdgeInsets.all(16),
    hintStyle: TextStyle(color: mediumGray, fontSize: 16),
  ),
);
