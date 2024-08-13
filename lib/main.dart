import 'package:flutter/material.dart';
import 'package:project_musium/pages/launch_screen.dart';
import 'package:project_musium/pages/welcome_screen.dart';

void main ()  => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
