import 'package:flutter/material.dart';
// import 'package:university_app/screens/register.dart';
// import 'package:university_app/screens/homepage.dart';
import 'package:university_app/screens/login.dart';
// import 'package:university_app/screens/profile.dart';
import 'package:university_app/screens/homepage.dart';

class editprofile extends StatefulWidget{
  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  
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
                   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Login(),));
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
          const Text('Edit Profile',
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
                Positioned(
                  bottom:0,
                  right: 0,
                  child: Container(
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: Colors.black
                  ),
                  child:Icon(Icons.edit, color: Colors.white,),
    
                ))
              ],
            ),
          ),
          const SizedBox(
            height:35, 
          ),
          const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Full Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Maxwell James",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
             suffixIcon: Icon(Icons.edit,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 35,),
            const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "maxwelljames@gmail.com",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
              suffixIcon: Icon(Icons.edit,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 35,),
            const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Phone Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "911",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
             suffixIcon: Icon(Icons.edit,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 35,),
            const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Course",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Software Development",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
              suffixIcon: Icon(Icons.edit,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 35,),
            const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "**********",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
              suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 35,),
            const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText:"Usernanme",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Username",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black
              ),
             suffixIcon: Icon(Icons.edit,color: Colors.black,),
            ),
    
          ),
          SizedBox(height: 20,),
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
            child:const Text('Save'),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Homepage(),),);
              //  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                 ScaffoldMessenger.of(context).showSnackBar( SnackBar
                 (content:const  Text('Saved Changes'),
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

              ]
              ,

          )
          
        ],
      ),
    ),
   
          
           ), 
           
       
         
        );

  }
}
