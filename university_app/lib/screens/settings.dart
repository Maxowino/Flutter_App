import 'package:flutter/material.dart';

class settings extends StatefulWidget{
 
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
              // SizedBox(height: 10,),
              // Card(
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //   child: Column(
              //     children: [
              //       ListTile(
              //         leading: Icon(Icons.language_rounded,color:Colors.black,),
              //       title: Text('Change Location'),
              //       trailing: Icon(Icons.keyboard_arrow_right_outlined),
              //       onTap: (){

              //       },
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height:10),
              SwitchListTile(
                activeColor: Colors.black,
                value: check1,
                title: Text('NewsLetter',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged: (value){
                   setState(() {
                      check1=!check1;
                  });

                },
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value: check2,
                title: Text('Updates',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                onChanged: (value){
                   setState(() {
                      check2=!check2;
                  });

                },
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value:check,
                title: Text('Events',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
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