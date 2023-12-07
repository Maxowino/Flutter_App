import 'package:flutter/material.dart';
// import 'package:university_app/screens/register.dart';
import 'package:university_app/screens/editprofile.dart';
// import 'package:university_app/screens/schoollogin.dart';
import 'package:university_app/screens/selectuser.dart';

class profile extends StatefulWidget{
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool showpassword=false;
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar:AppBar(
      title:const Text("Account Info"),backgroundColor: Colors.black, 
      centerTitle: true,
      actions:<Widget>[
     PopupMenuButton(
        icon:const Icon(Icons.menu, color:Colors.white),
        color:Colors.black,
        itemBuilder:(context)=>[
            PopupMenuItem( 
              child: Row(
                children: [
                  const Icon(Icons.settings,color:Colors.white),
                   Container(
                    margin:const EdgeInsets.only(left:10),
                    child:const Text('Settings',
                     style: TextStyle(
                 color: Colors.white,))),
                ],
                )
                ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.notifications,color:Colors.white),
                   Container(
                    margin:const EdgeInsets.only(left:10),
                    child:const Text('Notifications',
                     style: TextStyle(
                    color: Colors.white,)))
                ],
                )
                ),
                  PopupMenuItem(
              child: Row(
                children: [
                   const Icon(Icons.logout, color:Colors.white),
                   Container(
                    margin:const EdgeInsets.only(left:10),
                    child:const Text('Logout',
                       style: TextStyle(
                    color: Colors.white,)))
                ],
                ),
                onTap:(){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => selectUser (),));
                }
                )


        ]
       )
     
        ], 

    ),
    backgroundColor: Colors.grey,
  
   body:Container(
    padding: EdgeInsets.only(left: 16, top:16, right: 16),
    child: GestureDetector(
      onTap:(){FocusScope.of(context).unfocus();}, 
      child: ListView(
        children: [
          const Text('My Profile',
          style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold,),),
          const SizedBox(height: 15,),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height:130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow:const [
                        BoxShadow(
                          spreadRadius: 2,blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0,10),
                        )
                      ],
                    shape:BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.svgrepo.com%2Fsvg%2F437116%2Fperson-circle&psig=AOvVaw3bo9pkQjYAeAcUR8aG_RXN&ust=1698848352282000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIDWqbi9oIIDFQAAAAAdAAAAABAJ")
          
                    )
                    
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height:35, 
          ),
          buildTextField("Full Name", "Maxwell James",false),
          buildTextField("Email", "maxwelljames@gmail,com",false),
          buildTextField("Phone Number", "911",false),
          buildTextField("Course", "Software Development",false),
          buildTextField("Password", "********",true),
          buildTextField("Username","Username",true),
          
         Column(
             crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(
              child: ElevatedButton( 
            style: ElevatedButton.styleFrom(
              minimumSize:const Size(180,50),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              side: BorderSide.none
            ),
            child:const Text('Edit Profile'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) =>editprofile(),),);
            },

            )
          ),
         SizedBox(height:35),

              ]
              ,

          ), 
          
         
        ], 
      
      ),
    ),
   
        
           ), 
           
       
         
        );

  }

 Widget buildTextField(
    String labelText,String placeholder,bool isshowpassword
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isshowpassword?showpassword:false,
            decoration: InputDecoration(
              suffixIcon: isshowpassword?
              IconButton(
                onPressed: (){
                  setState(() {
                    showpassword=!showpassword;
                  });
                },
                icon: Icon(Icons.remove_red_eye ,
                color:Colors.grey),
                ):null,
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              )
            ),
      
          ),
    );
  }
}
