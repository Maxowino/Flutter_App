import 'package:flutter/material.dart';
import 'package:university_app/models/user.dart';
import 'package:university_app/screens/profile.dart';
import 'package:university_app/screens/grades.dart';
import 'package:university_app/screens/home.dart';
import 'package:university_app/screens/course.dart';


class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  int _currentindex=0;
  
  List<Widget> pagelist=[
    Homee(),
    Course(),
    grades(),
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
         icon: Icon(Icons.book),
         label:'Course',
       backgroundColor: Colors.black,
      
       
      ),  
      BottomNavigationBarItem(
         icon: Icon(Icons.grade_sharp),
         label:'Grades',
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
void addDialog(BuildContext context){
  

}
}

