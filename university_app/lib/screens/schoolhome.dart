import 'package:flutter/material.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/notifications.dart';
import 'package:university_app/screens/selectuser.dart';
import 'package:university_app/screens/schoolsetting.dart';
import 'package:firebase_auth/firebase_auth.dart';

class schoolHome extends StatelessWidget {
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
       backgroundColor: Colors.white,
       shadowColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
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
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notifications()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>schoolsetting()));
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
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
                        child: Text('Welcome to Our App. Created in 2023 , we aim to improving the education sector in Public Schools by providing a platform for High Schools to be able to get the Learning materials that they require to better the Learning process for their students.'
                        ' We specialize in connecting High School with the Ministry of Education for provision of the Approved Standard of Exercise Books and Text Books''Our Goal is to provide the Students with the neccessary materials that they need to succeed in their education'
                         'journey. We hope that you will continue with us in this process to help our Students get the quality Education that they Deserve. For more Information feel free to Contact Us.',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height:30),
                      Text('Contact Us',style:TextStyle(fontWeight: FontWeight.bold,fontSize:20 )),
                      SizedBox(height: 10),
                      SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(width: 10),
                        Icon(Icons.twitter),
                        SizedBox(width: 10),
                        Icon(Icons.instagram),
                        
                      ],
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
