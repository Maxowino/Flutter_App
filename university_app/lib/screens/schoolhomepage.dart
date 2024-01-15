// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:university_app/screens/resources.dart';
import 'package:university_app/screens/schoolhome.dart';
import 'package:university_app/screens/schoolrequests.dart';
import 'package:university_app/screens/schoolprofile.dart';

class schoolHomepage extends StatefulWidget{
  const schoolHomepage({super.key});

  @override
  State<schoolHomepage> createState() => _schoolHomepageState();
}

class _schoolHomepageState extends State<schoolHomepage> {
  
  int _currentindex=0;
  
  List<Widget> pagelist=[
    schoolHome(),
    Resources(),
    schoolrequests(),
    schoolprofile(),
  ];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    backgroundColor: Colors.grey,
    body:IndexedStack(
      index: _currentindex,
      children: pagelist,
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
         icon: Icon(Icons.book),
         label:'Resources',
       backgroundColor: Colors.black,
      
       
      ),  
      BottomNavigationBarItem(
         icon: Icon(Icons.grade_sharp),
         label:'My Requests',
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

