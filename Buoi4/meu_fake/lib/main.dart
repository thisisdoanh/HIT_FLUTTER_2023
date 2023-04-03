import 'package:flutter/material.dart';
import 'package:meu_fake/dummy_categories.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DummyCategories(),
    );
  }
}
