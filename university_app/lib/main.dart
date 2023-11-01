import 'package:flutter/material.dart';
// import 'package:university_app/screens/home_screen.dart';
// import 'package:university_app/screens/login.dart';
import 'package:university_app/screens/splashcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material widget takes below properties
        title: "App",
        debugShowCheckedModeBanner:false,
       home:splashscreen(),
    );
  }
}