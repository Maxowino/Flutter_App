import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class adminscreen extends StatefulWidget {
  @override
  State<adminscreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<adminscreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
     body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
        final users =snapshot.data?.docs ?? [];
        return Container(
          color: Colors.grey, // Set the background color to grey
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
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
            ),
          ),
        );
      },
    ));
  }
}
