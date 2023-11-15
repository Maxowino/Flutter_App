import 'package:flutter/material.dart';
import 'package:university_app/models/request.dart';
// import 'package:university_app/screens/login.dart';
// import 'package:university_app/screens/editprofile.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/selectuser.dart';
class schoolrequests extends StatefulWidget{
  @override
  State<schoolrequests> createState() => _schoolrequestState();
}

class _schoolrequestState extends State<schoolrequests> {

  List<request> requests=[];
  // addrequestdialog(BuildContext context){
  //   TextEditingController 
  // }


 @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey,
    appBar:AppBar(
      title:const Text("My Requests"),backgroundColor: Colors.black, 
      centerTitle: true,  
    ),
    drawer: Drawer(
    child: ListView(
      
      padding: EdgeInsets.zero,
      children:  <Widget>[ 
        DrawerHeader(
       
          decoration: const BoxDecoration(
            color: Colors.black, 
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
             Container(
                width: 100,
                height:100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow:const [
                      BoxShadow(
                        spreadRadius: 2,blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(0,10),
                      )
                    ],
                  shape:BoxShape.circle,
                  
                ),
              ),
              const Text(
                'Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
       
        const ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification'),
        ),
       
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
          ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Feedback'),
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder:(context) => feedback(),));
          }
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>selectUser()));
          },
        ),
      ],
    ),
  ),

    body:const SingleChildScrollView(
        child: Center(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text ('My Requests', style: TextStyle(fontSize:50,fontWeight: FontWeight.bold ),)
              ],

            ),

        ),

    ),
    );

}
}





















//  drawer: Drawer(
//     child: ListView(
      
//       padding: EdgeInsets.zero,
//       children:  <Widget>[ 
//         DrawerHeader(
       
//           decoration: BoxDecoration(
//             color: Colors.black, 
            
//           ),
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
                
//                Container(
//                   width: 100,
//                   height:100,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 4,
//                       color: Theme.of(context).scaffoldBackgroundColor),
//                       boxShadow:const [
//                         BoxShadow(
//                           spreadRadius: 2,blurRadius: 10,
//                           color: Colors.black,
//                           offset: Offset(0,10),
//                         )
//                       ],
//                     shape:BoxShape.circle,
                    
//                   ),
//                 ),
//                 Text(
//                   'Me',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const ListTile(
//           leading: Icon(Icons.message),
//           title: Text('Messages'),
//         ),
//         ListTile(
//           leading: Icon(Icons.account_circle),
//           title: Text('Profile'),
//           onTap:(){
//             Navigator.push(context, MaterialPageRoute(builder:(context) => editprofile(),));
//           }
//         ),
//         const ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Settings'),
//         ),
//         ListTile(
//           leading: Icon(Icons.logout),
//           title: Text('Log Out'),
//           onTap: (){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
//           },
//         ),
//       ],
//     ),
//   ),