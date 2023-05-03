import 'package:flutter/material.dart';
import 'package:muharrir/lotin_kiril.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muharrir UZ',
      theme: ThemeData(    
        textTheme: const TextTheme(),   
        primarySwatch: Colors.blue,
      ),
      home:  const Lotin_KirilPage(),
    );
  }
}