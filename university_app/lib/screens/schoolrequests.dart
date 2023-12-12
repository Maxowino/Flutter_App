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
        title: const Text("My Requests",style:TextStyle(color:Colors.white)),
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
               SizedBox(height: 20),
              Text('My Requests', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              UserDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // If user is not logged in, show an error message or redirect to login screen
      return Center(
        child: Text("Please Update your data."),
      );
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Resource-request')
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

        return DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Item')),
            DataColumn(label: Text('Quantity')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(data['name'] ?? '')),
              DataCell(Text('Exercise Books')),
              DataCell(Text('${data['exerciseBooks']}')),
            ]),
            DataRow(cells: [
              DataCell(Text(data['name'] ?? '')),
              DataCell(Text('Form 1 Textbooks')),
              DataCell(Text('${data['form1Textbooks']}')),
            ]),
            DataRow(cells: [
               DataCell(Text(data['name'] ?? '')),
              DataCell(Text('Form 2 Textbooks')),
              DataCell(Text('${data['form2Textbooks']}')),
            ]),
            DataRow(cells: [
              DataCell(Text(data['name'] ?? '')),
              DataCell(Text('Form 3 Textbooks')),
              DataCell(Text('${data['form3Textbooks']}')),
            ]),
            DataRow(cells: [
              DataCell(Text(data['name'] ?? '')),
              DataCell(Text('Form 4 Textbooks')),
              DataCell(Text('${data['form4Textbooks']}')),
            ]),
          ],
        );
      },
    );
  }
}
