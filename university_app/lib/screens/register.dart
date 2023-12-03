import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:university_app/models/user.dart';
import 'package:university_app/screens/schoollogin.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showpassword=true;
 // List<user> users=[];
  final formkey= GlobalKey<FormState>();
  final TextEditingController email= TextEditingController();
  final TextEditingController phonecontroller=TextEditingController();
  final TextEditingController pass=TextEditingController();
  final TextEditingController user=TextEditingController();

 
 
   
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey,
  
   body:Center(
        
     child:Container(
       width:250,
        padding:const EdgeInsets.fromLTRB(0,0, 0, 0),
        
          child:  Form(
            key: formkey,
            child: Column(  
               crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               
               const  Icon(
               Icons.account_circle_sharp,
              color: Colors.black,
             size: 75.0,
            //  semanticLabel: 'Text to announce in accessibility modes',
              ),
              const Text('Register', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Padding( 
               padding:EdgeInsets.fromLTRB(0,15,0,15),
              child:TextFormField(
               controller: email,
               keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10,0, 10,0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Email',
              
              ),
               validator: (value) {
                 bool emailvalidate= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                if(value.isEmpty){
                  return "Enter your Email";
                }
                 
                 if (!emailvalidate){
                  return "Enter Valid Email";
                 }
                 return null;

              } ,
            ),),
          
            Padding( 
               padding:EdgeInsets.fromLTRB(0,15,0,15),
                child:TextFormField(
                  controller: user,
                        validator: (value) {
                 if (value == null || value.isEmpty) {
                return 'Please enter  a Username';
                  }
                return null;
                  },
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10,0, 10,0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Username',
              
              ),
            ),),
          
             Padding( 
               padding:EdgeInsets.fromLTRB(0,15,0,15),
                child:TextFormField(
                  controller: phonecontroller,
                        validator: (value) {
                 if (value == null || value.isEmpty) {
                return 'Please enter  your Phone Number';
                  }
                return null;
                  },
                  keyboardType: TextInputType.phone,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10,0, 10,0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Phone Number',
              
              ),
            ),),
             
            Padding( 
               padding:EdgeInsets.fromLTRB(0,15,0,15),
                   child:TextFormField(
                    controller: pass,
                          validator: (value) {
                 if (value == null || value.isEmpty) {
                return 'Please enter  a password';
                  }
                return null;
                  },
                  obscureText:showpassword,
                  decoration: InputDecoration(
                  suffixIcon: 
                IconButton(
                  onPressed: (){
                    setState(() {
                      showpassword=!showpassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye ,
                  ),
                  ),
              contentPadding: const EdgeInsets.fromLTRB(10,0, 10,0),
              border:  OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                labelText: 'Enter Password',
              
              ),
              // validator: (value) {
              //   if(value!.isEmpty)
              //   {
              //     return "Enter Password";
              //   }
              //   else if(pass.text.length<5)
              //   {
              //     return "Password Should be more than 5 characters long";
              //   }
              //   return null;
              // },
            ),),
          
          
                Padding( 
                  padding:const EdgeInsets.fromLTRB(0,25,0,15),
            child: ElevatedButton( 
              style: ElevatedButton.styleFrom(
                minimumSize:const Size(180,50),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: BorderSide.none
              ),
              child:const Text('Register'),
              onPressed: (){
                    if (formkey.currentState!.validate()){
                   ScaffoldMessenger.of(context).showSnackBar( SnackBar
                   (content:const Text('Registration Successful!'),
                   backgroundColor: Colors.black,
                   duration:const Duration(seconds:3),
                   dismissDirection: DismissDirection.up,
                   behavior: SnackBarBehavior.floating,
                   margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 120,
                    left: 40,
                    right:40,
                   ),
                   
                  ));
                    }
              },
          
              )),
               Padding( 
                  padding:const EdgeInsets.fromLTRB(0,15,0,15),
                   child:RichText(
            text:  TextSpan(
              children:[
                  const TextSpan(
                    text: "Already Have An Account? ",
                    style: TextStyle(color: Colors.black,fontSize:14)
                  ),
                  TextSpan(
                    text: "Login",
                    style: TextStyle(color: Colors.white,fontSize: 14),
                    recognizer: TapGestureRecognizer()..onTap=(){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Login(),));
          
                    }
                  ),
              ]
            ))
            // 
          
          
            
            )]
             ),
          ), 
           
       
         
        ),
        
     )
   );
  }
}
