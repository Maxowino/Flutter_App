import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Requests'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Resource-request').snapshots(),
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
                DataCell(Text('${data['form1Textbooks'] ?? ''}')),
                DataCell(Text('${data['form2Textbooks'] ?? ''}')),
                DataCell(Text('${data['form3Textbooks'] ?? ''}')),
                DataCell(Text('${data['form4Textbooks'] ?? ''}')),
              ],
            );
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            
            child: DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Form 1 Textbooks')),
                DataColumn(label: Text('Form 2 Textbooks')),
                DataColumn(label: Text('Form 3 Textbooks')),
                DataColumn(label: Text('Form 4 Textbooks')),
              ],
              rows: dataRows,
            ),
          );
        },
      ),
    );
  }
}
