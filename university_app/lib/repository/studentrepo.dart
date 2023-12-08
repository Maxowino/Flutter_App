import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university_app/models/studentmodel.dart';
import 'package:get/get.dart';

class StudentRepo extends GetxController {
  // Change to 'instance' instead of 'get instance'
  static StudentRepo get instance => Get.find();
  
  final db = FirebaseFirestore.instance; 

  createUser(studentmodel student)async{
      await db.collection("Students").add(student.toJson())
      .whenComplete((){
        Get.snackbar(
        "Success", "Registration Successful",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black,
        colorText: Colors.white);
  })
        .catchError((error,stackTrace)
        // ignore: body_might_complete_normally_catch_error
        {
          Get.snackbar("Error", "Something went wrong. Try Again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.red);
          print("ERORR-$error");
        });
  }

 
  Future<studentmodel?> getUserDetails(String email) async {
    try {
      
      final snapshot = await db.collection("Students").where("email", isEqualTo: email).limit(1).get();

      
      if (snapshot.docs.isNotEmpty) {
        final studentsData = snapshot.docs.map((e) => studentmodel.fromSnapshot(e)).single;
        return studentsData;
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting user details: $e");
      return null;
    }
  }

  Future<List<studentmodel>> getAllUsers() async {
    try {
      final snapshot = await db.collection("Students").get();
      final studentsData = snapshot.docs.map((e) => studentmodel.fromSnapshot(e)).toList();
      return studentsData;
    } catch (e) {
      print("Error getting all users: $e");
      return [];
    }
  }
}
