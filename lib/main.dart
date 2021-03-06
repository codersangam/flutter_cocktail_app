import 'package:cocktail_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const Color myColor = Colors.brown;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail App',
      theme: ThemeData(
          primarySwatch: Colors.orange, backgroundColor: Colors.orange),
      home: const HomeScreen(),
    );
  }
}
