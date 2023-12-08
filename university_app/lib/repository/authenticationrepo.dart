import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();

  final auth= FirebaseAuth.instance;
  late final Rx<User?>firebaseUser;

  
  
}