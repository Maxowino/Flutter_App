import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/schoollogin.dart';
import 'package:university_app/screens/studentlogin.dart';
import 'package:university_app/screens/adminlogin.dart';

class selectUser extends StatefulWidget{
 
  @override
  State<selectUser> createState()=>_selectUserState();

}
class _selectUserState extends  State<selectUser> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Custom height for the AppBar
        child: AppBar(
          title: const Text('Select User',style:TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: const Text('Admin'),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => adminlogin()));
                    },
                  ),
                ];
              },
            ),
        ],
      )),
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
        child:  SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
        
                  height:200,
                  child: Card(
                    margin: const EdgeInsets.all(50),
                    elevation:20,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize:MainAxisSize.min ,
                        children: [
                          const SizedBox(height: 8,),
                          const Text('SCHOOL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextButton(
                          child: const Text('Continue as the head of a school',style: TextStyle(color: Colors.black),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                
                          }, ),
                        ],
                        
                    
                      ),
                    ),
                  ),
                ),
                const Text('OR',style:TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold)),
                 SizedBox(
        
                  height:200,
                  child: Card(
                    margin: const EdgeInsets.all(50),
                    elevation:20,
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisSize:MainAxisSize.min ,
                        children: [
                          const SizedBox(height: 8,),
                          const Text('STUDENT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          TextButton(
                          child: const Text('Continue as a Student',style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>studentlogin()));
                
                          }, ),
                        ],
                        
                    
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ) 
       
          
            

              
         

        
      
  

    );
  }
}