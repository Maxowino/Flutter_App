import 'package:flutter/material.dart';
import 'package:university_app/screens/homepage.dart';

class feedback extends StatefulWidget{
 
  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context){

return Scaffold(
  appBar: AppBar(
 
      title:const Text("Feedback and Suggestions"),backgroundColor: Colors.black, 
      centerTitle: true,
  ),
  backgroundColor: Colors.grey,
  body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Your Feedback will help us improve your experience with us ',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              minLines: 2,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Enter your Suggestion and feedback',
                border:OutlineInputBorder( borderRadius:BorderRadius.all(Radius.circular(10)),)
              ),
              
            ),
          ),
            SizedBox(
              child: ElevatedButton( 
            style: ElevatedButton.styleFrom(
              minimumSize:const Size(180,50),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              side: BorderSide.none
            ),
            child:const Text('Send'),
            onPressed: (){
            
             Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>const Homepage(),),);
                 ScaffoldMessenger.of(context).showSnackBar( SnackBar
                 (content:const  Text('Thank you for your Feedback!'),
                 backgroundColor: Colors.black,
                 duration:const Duration(seconds:2),
                 dismissDirection: DismissDirection.up,
                 behavior: SnackBarBehavior.floating,
                 margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 170,
                  left: 40,
                  right:40,
                 ),
                 
                ));
            },

            )
          ),
   
        ],
        
    
      ),
      
    ),
  );


  }
}