import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:university_app/repository/authenticationrepo.dart';

class signupcontroller extends GetxController{
  static signupcontroller get instance=>Get.find();

  final email=TextEditingController();
  final phone=TextEditingController();
  final pass=TextEditingController();
  final user=TextEditingController();

  void registerUser(String email, String pass)
  {
    String?error=AuthenticationRepository.instance.createUserWithEmailAndPassword(email,pass)as String?;
    if(error!=null){
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
  void createUser(String)




}