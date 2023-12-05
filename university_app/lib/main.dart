import 'package:flutter/material.dart';
import 'package:university_app/screens/splashcreen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "App",
        debugShowCheckedModeBanner:false,
       home:splashscreen(),
    );
  }
}