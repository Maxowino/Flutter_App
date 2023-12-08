import 'package:flutter/material.dart';
// import 'package:university_app/screens/selectuser.dart';
class grades extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey,
   appBar:AppBar(
      title:const Text("Grades"),backgroundColor: Colors.black, 
      centerTitle: true,
    //   actions:<Widget>[
    //  PopupMenuButton(
    //     icon:const Icon(Icons.menu, color:Colors.white),
    //     color:Colors.black,
    //     itemBuilder:(context)=>[
    //         PopupMenuItem(
    //           child: Row(
    //             children: [
    //               const Icon(Icons.settings,color:Colors.white),
    //                Container(
    //                 margin:const EdgeInsets.only(left:10),
    //                 child:const Text('Settings',
    //                  style: TextStyle(
    //              color: Colors.white,))),
    //             ],
    //             )
    //             ),
    //         PopupMenuItem(
    //           child: Row(
    //             children: [
    //               const Icon(Icons.notifications,color:Colors.white),
    //                Container(
    //                 margin:const EdgeInsets.only(left:10),
    //                 child:const Text('Notifications',
    //                  style: TextStyle(
    //                 color: Colors.white,)))
    //             ],
    //             )
    //             ),
    //               PopupMenuItem(
    //           child: Row(
    //             children: [
    //                const Icon(Icons.logout, color:Colors.white),
    //                Container(
    //                 margin:const EdgeInsets.only(left:10),
    //                 child:const Text('Logout',
    //                    style: TextStyle(
    //                 color: Colors.white,)))
    //             ],
    //             ),
    //             onTap:(){
    //                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => selectUser(),));
    //             }
    //             )


    //     ]
    //    )
     
    //     ], 
        
      
    ),
    body:const SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text ('My Grades', style: TextStyle(fontSize:50,fontWeight: FontWeight.bold ),),
                SizedBox(height: 15,),
                Text('Apply to study abroad. Please submit all the required documents and fill in all the required details.'),
                SizedBox(height: 25,),
                Form(
                  child: Column(
                    children: [
                      
                        
                
                    ]),),
              ],

            ),

        ),

    ),
    );

}
}