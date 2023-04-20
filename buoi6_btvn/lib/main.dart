import 'package:buoi6_btvn/contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.pink[50],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: AllContact(),
      ),
    );
  }
}
