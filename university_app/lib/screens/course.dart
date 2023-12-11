import 'package:flutter/material.dart';
// import 'package:university_app/screens/selectuser.dart';
class Course extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey,
    appBar:AppBar(
      title:const Text("Course"),backgroundColor: Colors.black, 
      centerTitle: true,
    ),
    body:const SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text ('My Course', style: TextStyle(fontSize:50,fontWeight: FontWeight.bold ),)
              ],

            ),

        ),

    ),
    );

}
}