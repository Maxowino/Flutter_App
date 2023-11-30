import 'package:flutter/material.dart';

class settings extends StatefulWidget{
 
  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context){

return Scaffold(
   
   appBar: AppBar(
    title: const Text('Settings',style: TextStyle(fontWeight: FontWeight.w500),),backgroundColor: Colors.black,
    centerTitle: true,

   ),

    body:const Center(
      child: Column(
         
      ),
    ) 

);
}
}