import 'package:flutter/material.dart';
import 'package:university_app/screens/adminscreens.dart';
import 'package:university_app/screens/admindata.dart';
import 'package:university_app/screens/adminrequest.dart';
import 'package:university_app/screens/adminstudent.dart';


class adminhomepage extends StatefulWidget{
  @override
  State<adminhomepage> createState() => _adminhomepageState();
}

class _adminhomepageState extends State<adminhomepage> {
  int _currentindex=0;
  List<Widget> pageslist=[
    adminscreen(),
    admindata(),
    DataRequest(),
    studentdata(),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: Colors.grey,
    body:IndexedStack(
      children: pageslist,
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
         icon: Icon(Icons.person_outlined),
         label:'Students',
       backgroundColor: Colors.black,
       
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.school_outlined),
         label:'Schools',
       backgroundColor: Colors.black,
       
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.contact_page_sharp),
         label:'AllRequests',
       backgroundColor: Colors.black,
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.web_outlined),
         label:'Student Application',
       backgroundColor: Colors.black, 
      )

    ],
      
    ));
  }
}