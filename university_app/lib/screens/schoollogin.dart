import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/register.dart';
import 'package:university_app/screens/schoolhomepage.dart';

class Login extends StatefulWidget{
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool showpassword=true;

    bool checkedbox=false;
  final logindetails=GlobalKey<FormState>();
  final user=TextEditingController();
  final pass=TextEditingController();
  //  var snackbar= const SnackBar(content: Text('Login In Successful'),
  //     backgroundColor: Colors.red,
  //     padding: EdgeInsets.fromLTRB(0, 0, 0, 2),);
  // bool _isobscure=true;
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
            //  semanticLabel: 'Text to announce in accessibility modes',
              ),
              const Text('Login', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding( 
               padding:const EdgeInsets.fromLTRB(0,15,0,15),
                child:TextFormField(
               controller: user,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person),
              contentPadding: const EdgeInsets.fromLTRB(10,0, 10,0),
             border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Username',
              
              ),
            ),),
          
                   const SizedBox(height: 20,),
                   SizedBox(
                child:TextFormField(
                  obscureText:showpassword,
                  controller: pass,
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
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>schoolHomepage(),),);
                //  ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
                   
                  ));
              },
          
              )
            ),
            SizedBox(height: 20,),
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
                  Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
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
                     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
          
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