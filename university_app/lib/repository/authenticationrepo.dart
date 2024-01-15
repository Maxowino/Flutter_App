import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:university_app/models/studentmodel.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();

  final auth= FirebaseAuth.instance;
  late final Rx<User?>firebaseUser;

  createUserWithEmailAndPassword(String email, String pass) {
    email=email;
    pass=pass;
  }

  
  
}
class studentmodel{
  final String? id;
  final String? email;
  final String?  phone;
  final String? pass;
  final String? user;

  const studentmodel({
    this.id,
    required this.email,
    required this.phone,
    required this.pass,
    required this.user
  });
  // toJson(){
  //   return{
  //    "email":email,
  //    "phone":phone,
  //    "password":pass,
  //    "username":user,
  //   };
  // }
  factory studentmodel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
    final data=document.data()!;
    return studentmodel(id:document.id,email: data["email"], phone:data["password"], pass: data["phone"], user: data["username"]);

  }


}