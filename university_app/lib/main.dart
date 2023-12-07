import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/splashcreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await addDataToFirestore('email@gmail.com', '2345654321', 'password', 'username');
  runApp(MyApp());
}

Future<void> addDataToFirestore(email, phone, pass, user) async {
  CollectionReference registerReference = FirebaseFirestore.instance.collection('Students');

  await registerReference.add({
    'email': email,
    'phone': phone,
    'password': pass,
    'username': user,
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App",
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
