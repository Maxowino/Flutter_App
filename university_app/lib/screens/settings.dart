// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class settings extends StatefulWidget{
  const settings({super.key});

 
  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool check=true;
   bool check1=true;
  bool check2=true;
  @override
  Widget build(BuildContext context){

return Scaffold(
  backgroundColor: Colors.grey,
   
   appBar: AppBar(
    title: const Text('Settings',style: TextStyle(fontWeight: FontWeight.w500),),backgroundColor: Colors.black,
    centerTitle: true,

   ),

    body: SingleChildScrollView(
      
        child: Column(
         
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:10),
              SwitchListTile(
                activeColor: Colors.black,
                value: check1,
                title: const Text('NewsLetter',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged: (value){
                   setState(() {
                      check1=!check1;
                  });

                },
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value: check2,
                title: const Text('Updates',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged: (value){
                   setState(() {
                      check2=!check2;
                  });

                },
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value:check,
                title: const Text('Events',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged: (value){
                  setState(() {
                      check=!check;
                  });
                },
              ),    
            ], 
        ),
      ),
     

);
}
}