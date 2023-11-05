import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/schoollogin.dart';
import 'package:university_app/screens/studentlogin.dart';

class selectUser extends StatefulWidget{

  @override
  State<selectUser> createState()=>_selectUserState();

}
class _selectUserState extends  State<selectUser> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: AnimatedBackground(

        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
           
              spawnMaxRadius: 10,
              spawnMinSpeed: 10.00,
              particleCount: 68,
              spawnMaxSpeed: 40,
              minOpacity: 0.2,
              spawnOpacity: 0.3,
              baseColor: Colors.black,
              // image: Image(image: AssetImage(assetName))
           
          ),
        ),

        vsync:this,
        child:  Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('Select User',style: TextStyle(fontSize: 34,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              Container(

                height:200,
                child: Card(
                  margin: EdgeInsets.all(50),
                  elevation:20,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize:MainAxisSize.min ,
                      children: [
                        SizedBox(height: 8,),
                        Text('SCHOOL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        TextButton(
                        child: Text('Continue as the head of a school',style: TextStyle(color: Colors.black),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              
                        }, ),
                      ],
                      
                  
                    ),
                  ),
                ),
              ),
              Text('OR',style:TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold)),
               Container(

                height:200,
                child: Card(
                  margin: EdgeInsets.all(50),
                  elevation:20,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisSize:MainAxisSize.min ,
                      children: [
                        SizedBox(height: 8,),
                        Text('STUDENT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        TextButton(
                        child: Text('Continue as a Student',style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>studentlogin()));
              
                        }, ),
                      ],
                      
                  
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ) 
       
          
            

              
         

        
      
  

    );
  }
}