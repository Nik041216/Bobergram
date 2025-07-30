import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      surface: Colors.grey[100]!,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.black,
      elevation: 0.5,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
    // Иконки
    iconTheme: const IconThemeData(color: Colors.black),

    // ListTile
  listTileTheme: ListTileThemeData(
    textColor: Colors.black,
    iconColor: Colors.black,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
  ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),

    // Drawer
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),

    tabBarTheme: const TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.black,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),

    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue[300]!,
      secondary: Colors.lightBlueAccent,
      surface: Colors.grey[900]!,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0.5,
    ),
    // Текст
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

    // Иконки
    iconTheme: const IconThemeData(color: Colors.white),

    // ListTile
    listTileTheme: ListTileThemeData(
      textColor: Colors.white,
      iconColor: Colors.white,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),

    // FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue[300],
      foregroundColor: Colors.black,
    ),

    // Drawer
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),

    tabBarTheme: const TabBarThemeData(
      labelColor: Colors.lightBlueAccent,
      unselectedLabelColor: Colors.white54,
      indicatorColor: Colors.lightBlueAccent,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),

    useMaterial3: true,
  );
}