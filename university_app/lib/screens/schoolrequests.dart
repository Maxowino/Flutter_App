import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/selectuser.dart';

class schoolrequests extends StatefulWidget {
  @override
  State<schoolrequests> createState() => _SchoolRequestsState();
}

class _SchoolRequestsState extends State<schoolrequests> {
 List<Map<String, dynamic>> requests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("My Requests"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: Drawer(
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
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectUser()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('My Requests', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              UserDataList(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // If user is not logged in, show an error message or redirect to login screen
      return Center(
        child: Text("User not logged in."),
      );
    }

   return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('schoolrequests')
          .doc(user.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If data is still being fetched, show a loading indicator
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          // If no data is available, show a message or handle the error
          return Center(
            child: Text("No data available."),
          );
        }

        // Retrieve data from the snapshot
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              title: Text("Exercise Books: ${data['exerciseBooks']}"),
            ),
            ListTile(
              title: Text("Form 1 Textbooks: ${data['form1Textbooks']}"),
            ),
            ListTile(
              title: Text("Form 2 Textbooks: ${data['form2Textbooks']}"),
            ),
            ListTile(
              title: Text("Form 3 Textbooks: ${data['form3Textbooks']}"),
            ),
            ListTile(
              title: Text("Form 4 Textbooks: ${data['form4Textbooks']}"),
            ),
            ListTile(
              title: Text("Lab Equipment: ${data['labEquipment']}"),
            ),
          ],
        );
      },
    );
  }
}