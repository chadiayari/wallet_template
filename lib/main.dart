import 'package:flutter/material.dart';
import 'screens/sign_screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Abu Dhabi community cooperative تعاونية أبوظبي المجتمعية',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const WelcomeScreen());
  }
}
