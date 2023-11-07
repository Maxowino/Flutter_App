import 'package:flutter/material.dart';
// import 'package:university_app/screens/profile.dart';
// import 'package:university_app/screens/home.dart';
// import 'package:university_app/screens/course.dart';
import 'package:university_app/screens/resources.dart';
import 'package:university_app/screens/schoolhome.dart';
import 'package:university_app/screens/schoolrequests.dart';


class schoolHomepage extends StatefulWidget{
  const schoolHomepage({super.key});

  @override
  State<schoolHomepage> createState() => _schoolHomepageState();
}

class _schoolHomepageState extends State<schoolHomepage> {
  
  int _currentindex=0;
  
  List<Widget> pagelist=[
    schoolHome(),
    resources(),
    schoolrequests(),
  

  ];
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
         icon: Icon(Icons.book),
         label:'Resources',
       backgroundColor: Colors.black,
      
       
      ),  
      BottomNavigationBarItem(
         icon: Icon(Icons.grade_sharp),
         label:'My Requests',
         backgroundColor: Colors.black,
       
      ),   

    ],
   

 ));
}
}

