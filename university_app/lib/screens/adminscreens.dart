import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class adminscreen extends StatefulWidget {
  @override
  State<adminscreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<adminscreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? currentUser = snapshot.data;
            if (currentUser != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildUserList('Students'),
                  // Add more collections if needed
                ],
              );
            } else {
              // User is not authenticated
              return Center(
                child: Text('Not authenticated. Please log in.'),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking authentication
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Handle other connection states if necessary
            return Center(
              child: Text('Unexpected connection state: ${snapshot.connectionState}'),
            );
          }
        },
      ),
    );
  }

  Widget buildUserList(String collectionName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Users in Collection $collectionName:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection(collectionName).snapshots(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (userSnapshot.hasError) {
              return Center(
                child: Text('Error: ${userSnapshot.error}'),
              );
            }

            // Display user details from Firestore in a DataTable
            final users = userSnapshot.data?.docs ?? [];
            return DataTable(
              columns: [
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Phone')),
                DataColumn(label: Text('Username')),
              ],
              rows: users.map<DataRow>((user) {
                final userData = user.data() as Map<String, dynamic>;
                final userEmail = userData['email'] as String;
                final userPhone = userData['phone'] as String;
                final username = userData['username'] as String;

                return DataRow(
                  cells: [
                    DataCell(Text(userEmail)),
                    DataCell(Text(userPhone)),
                    DataCell(Text(username)),
                  ],
                );
              }).toList(),
            );
          },
        ),
        Divider(),
      ],
    );
  }
}
