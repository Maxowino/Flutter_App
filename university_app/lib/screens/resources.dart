import 'package:flutter/material.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/selectuser.dart';

class resources extends StatefulWidget{
  @override
  State<resources> createState()=>_resourcesState();
   
}  
class _resourcesState extends State<resources>{
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.grey,
    appBar:AppBar(
      title:const Text("Resources"),backgroundColor: Colors.black, 
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
          child: Container(
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
          leading: Icon(Icons.message),
          title: Text('Feedback'),
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder:(context) => feedback(),));
          }
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out'),
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
                Text ('Resources', style: TextStyle(fontSize:50,fontWeight: FontWeight.bold ),)
              ],

            ),

        ),

    ),

    );


}
// void  addrequests(BuildContext context)
// {
//   TextEditingController nameController= new TextEditingController();
//   TextEditingController emailController= new TextEditingController();
//   TextEditingController passController= new TextEditingController();
//   TextEditingController phoneController= new TextEditingController();
//   showDialog(context: context, builder: (context){
//   return AlertDialog();});


  
// }

}


  //        actions:<Widget>[
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
    //                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Login(),));
    //             }
    //             )


    //     ]
    //    )
     
    //     ],  
    