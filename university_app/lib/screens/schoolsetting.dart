import 'package:flutter/material.dart';

class schoolsetting extends StatefulWidget{
  @override
  State<schoolsetting> createState() => _schoolsettingState();
}

class _schoolsettingState extends State<schoolsetting> {
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
              const SwitchListTile(
                activeColor: Colors.black,
                value: false,
                title: Text('Order Updates',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged:null,
                 
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value: check2,
                title: const Text('Notifications',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
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