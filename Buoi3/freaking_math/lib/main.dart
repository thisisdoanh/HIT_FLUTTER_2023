import 'package:flutter/material.dart';
import 'package:freaking_math/math/math.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: FreakingMath(),
      ),
    );
  }
}
