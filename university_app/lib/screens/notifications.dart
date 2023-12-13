import 'package:flutter/material.dart';

class notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title:const Text("Notifications",style: TextStyle(color:Colors.white),),backgroundColor: Colors.black, 
          centerTitle: true,

      ),

      body: SingleChildScrollView(
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