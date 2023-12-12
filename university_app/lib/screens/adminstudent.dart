import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Application'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Form-Application').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          List<DataRow> dataRows = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            return DataRow(
              cells: [
                DataCell(Text(data['name'] ?? '')),
                DataCell(Text(data['location'] ?? '')),
                DataCell(Text(data['school'] ?? '')),
                DataCell(Text(data['course'] ?? '')),
                DataCell(Text(data['university'] ?? '')),
              ],
            );
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Current School')),
                DataColumn(label: Text('Applying Course')),
                DataColumn(label: Text('Applying University')),
              ],
              rows: dataRows,
            ),
          );
        },
      ),
    );
  }
}

