// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/schoolhomepage.dart';
import 'package:university_app/screens/schoolregister.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget{
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool showpassword=true;
    bool checkedbox=false;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GlobalKey<FormState> logindetails=GlobalKey<FormState>();
    final TextEditingController user=TextEditingController();
    final TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey,
  
   body:Center(
        
     child:Container(
       width:250,
        padding:const EdgeInsets.fromLTRB(0,0, 0, 0),
        
          child:  Form(
            key:logindetails,
            child: Column(  
              //  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               
               const  Icon(
               Icons.account_circle_sharp,
              color: Colors.black,
             size: 75.0,
            
              ),
              const Text('Login', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding( 
               padding:const EdgeInsets.fromLTRB(0,15,0,15),
                child:TextFormField(
               controller: user,
                validator: (value) {
                 if (value == null || value.isEmpty) {
                return 'Please enter an Email';
                  }
                return null;
                  },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person),
              contentPadding: const EdgeInsets.fromLTRB(10,0, 10,0),
             border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Your Email',
              
              ),
            ),),
          
                   const SizedBox(height: 20,),
                   SizedBox(
                child:TextFormField(
                  obscureText:showpassword,
                  controller: pass,
                   validator: (value) {
                   if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                  }
                     return null;
                      },
                  decoration: InputDecoration(
                  suffixIcon: 
                IconButton(
                  onPressed: (){
                    setState(() {
                      showpassword=!showpassword;
                    });
                  },
                  icon:const Icon(Icons.remove_red_eye ,
                  ),
                  ),
              contentPadding: const EdgeInsets.fromLTRB(10,0, 10,0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Password',
              
              ),
            ),),
          
                  
                  
            const SizedBox(height: 35,),
            SizedBox(
                child: ElevatedButton( 
              style: ElevatedButton.styleFrom(
                minimumSize:const Size(180,50),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: BorderSide.none
              ),
              child:const Text('Login'),
              onPressed: ()async{
                if (logindetails.currentState!.validate()) {
                showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 16),
                                Text(
                                  "Loading...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                   try {
                          await _auth.signInWithEmailAndPassword(
                            email: user.text.trim(),
                            password: pass.text,
                          );
                   Navigator.pop(context);
                   
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>const schoolHomepage(),),);
                   ScaffoldMessenger.of(context).showSnackBar( SnackBar
                   (content:const  Text('Login Successful!'),
                   backgroundColor: Colors.black,
                   duration:const Duration(seconds:2),
                   dismissDirection: DismissDirection.up,
                   behavior: SnackBarBehavior.floating,
                   margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 170,
                    left: 40,
                    right:40,
                   ),
                   
                  ));}
                  catch (e) {
                          print('Error signing in: $e');
                           Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Invalid credentials. Please try again.'),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 3),
                               dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height - 170,
                                left: 40,
                                right: 40,
                              ),
                              
                            ),
                          );
                        }
              }
              }
              )
            ),
            const SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: checkedbox, onChanged: (bool? ischecked){
                   setState(() {
                      checkedbox=ischecked!;
                   });
                   
                  }
                  ),
                  const Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
              ],
            ),

             
                Padding( 
                  padding:const EdgeInsets.fromLTRB(0,15,0,15),
                  child:RichText(
            text:  TextSpan(
              children:[
                  const TextSpan(
                    text: "Don't Have an Account? ",
                    style: TextStyle(color: Colors.black,fontSize:14)
                  ),
                  TextSpan(
                    text: "Register Now",
                    style: const TextStyle(color: Colors.white,fontSize: 14),
                    recognizer: TapGestureRecognizer()..onTap=(){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>schoolregister(),));
          
                    }
                  ),
              ]
            ))
             ), 
             
                 
                   
             ],),
          )),
        
     ));
  }
}