import 'package:flutter/material.dart';
import 'package:university_app/models/user.dart';
import 'package:university_app/screens/profile.dart';
import 'package:university_app/screens/applyform.dart';
import 'package:university_app/screens/home.dart';


class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  int _currentindex=0;
  
  List<Widget> pagelist=[
    Homee(),
    DataEntryForm(),
    profile(),
  ];
  List<user> users=[];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
  //  appBar:AppBar(title:const Text("Homepage"),backgroundColor: Colors.black,
                  
  //  ),

    backgroundColor: Colors.grey,
    body:IndexedStack(
      children: pagelist,
      index: _currentindex,
    ),
     bottomNavigationBar:BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,

    currentIndex: _currentindex,
     onTap: (int newindex){
      setState((){
      _currentindex=newindex;}
      );

    },
      items:const [
      BottomNavigationBarItem(
         icon: Icon(Icons.home),
         label:'Home',
       backgroundColor: Colors.black,
       
      ),  
      BottomNavigationBarItem(
         icon: Icon(Icons.grade_sharp),
         label:'Application',
         backgroundColor: Colors.black,
       
      ),   
       BottomNavigationBarItem(
         icon: Icon(Icons.person),
         label:'Profile',
        backgroundColor: Colors.black,
       
      ),
      
    ],
   

 ));
}
}

