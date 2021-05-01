import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData(
        backgroundColor: Colors.white,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 35,
            opacity: .5,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
            size: 35,
            opacity: .5,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 2,
          selectedItemColor: Colors.deepOrange,
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.grey,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
      );
}
