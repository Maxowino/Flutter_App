import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_app/screens/selectuser.dart';

// ignore: camel_case_types
class adminscreen extends StatefulWidget {
  const adminscreen({super.key});

  @override
  State<adminscreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<adminscreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Students',style:TextStyle(color:Colors.white)),
        centerTitle: true,
        actions: [
            PopupMenuButton(
              color: Colors.black,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: const Text('Logout',style:TextStyle(color:Colors.white)),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectUser()));
                    },
                  ),
                ];
              },
            ),
        ],
      ),
     body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
        final users =snapshot.data?.docs ?? [];
        return Center(
          child:Container(
          color: Colors.grey, // Set the background color to grey
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Email',style: TextStyle(fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('Username',style: TextStyle(fontWeight: FontWeight.bold),)),
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
        )
        );
      },
    ));
  }
}
