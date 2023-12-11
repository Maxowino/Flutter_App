import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class admindata extends StatefulWidget {
  @override
  State<admindata> createState() => _admindataState();
}

class _admindataState extends State<admindata> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schools Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Schools').snapshots(),
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

          // Display data from Firestore in a DataTable
          final schools = snapshot.data?.docs ?? [];
          return DataTable(
            columns: [
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Location')),
              DataColumn(label: Text('Phone')),
            ],
            rows: schools.map<DataRow>((school) {
              final schoolData = school.data() as Map<String, dynamic>;
              final schoolEmail = schoolData['email'] as String;
              final schoolLocation = schoolData['location'] as String;
              final schoolPhone = schoolData['phone'] as String;

              return DataRow(
                cells: [
                  DataCell(Text(schoolEmail)),
                  DataCell(Text(schoolLocation)),
                  DataCell(Text(schoolPhone)),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

