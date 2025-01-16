import 'package:app_for_practice/theme.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login.dart';
import 'todolist.dart';
import 'profile.dart';
import 'chat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Cool Themed App',
      theme: AppTheme.lightTheme, // Use the light theme
      darkTheme: AppTheme.darkTheme, // Use the dark theme
      themeMode: ThemeMode.system, // Automatically switch based on system settings
      home: Login(), 
      // Login(), // Your Login widget
    );
  }
}
 