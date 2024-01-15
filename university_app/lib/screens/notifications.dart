// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class notifications extends StatelessWidget{
  const notifications({super.key});

  @override
  Widget build(BuildContext context){
    
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title:const Text("Notifications",style: TextStyle(color:Colors.white),),backgroundColor: Colors.black, 
          centerTitle: true,

      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10),
            Text('Today',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 4,),
            Card(
              child: Column(
                children:[
                  ListTile(
                    title: Text('No Notifications'),
                  
                )
                ]

              ),

            )
          ],
        ),
      ),

    );
    
  }
}