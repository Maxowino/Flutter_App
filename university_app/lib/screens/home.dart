// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/notifications.dart';
import 'package:university_app/screens/selectuser.dart';
import 'package:university_app/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homee extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      print("User signed out");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectUser()));
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Homepage",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0, 10),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    'Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notifications()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => settings()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const feedback()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                _signOut(context);
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('About Us', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height:500,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Text('Welcome to Our App. Created in 2022 , we aim to assist aspiring Students who want to study in their dream university to secure opportunities for them.In partnership with UniPass we assist you in your steps to secure sponsorships within'
                        ' and outside the country and guide them throughout their Education journey. Together with the Government of Kenya we have succeeded in convicing some of the biggest Universities around the world to enroll our students in the sponsorship program. '
                         'We hope to propel our students to reach their maximum potential by giving them this golden opportunity.',style:TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
