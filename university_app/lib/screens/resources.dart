import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_app/screens/feedback.dart';
import 'package:university_app/screens/selectuser.dart';

class Resources extends StatefulWidget {
  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController exerciseBooksController = TextEditingController();
  final TextEditingController form1TextbooksController = TextEditingController();
  final TextEditingController form2TextbooksController = TextEditingController();
  final TextEditingController form3TextbooksController = TextEditingController();
  final TextEditingController form4TextbooksController = TextEditingController();
  final TextEditingController labEquipmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Resources"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectUser()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Please Note that the number for TextBooks is the average for each subject', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                buildTextFormField(exerciseBooksController, 'Enter Exercise Books', TextInputType.number),
                buildTextFormField(form1TextbooksController, 'Enter Form 1 Textbooks', TextInputType.number),
                buildTextFormField(form2TextbooksController, 'Enter Form 2 Textbooks', TextInputType.number),
                buildTextFormField(form3TextbooksController, 'Enter Form 3 Textbooks', TextInputType.number),
                buildTextFormField(form4TextbooksController, 'Enter Form 4 Textbooks', TextInputType.number),
                buildTextFormField(labEquipmentController, 'Enter Lab Equipment', TextInputType.number),
                buildElevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller, String labelText, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: labelText,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget buildElevatedButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(180, 50),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          side: BorderSide.none,
        ),
        child: const Text('Submit'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Call a function to store the data in Firestore
            storeDataInFirestore();
          }
        },
      ),
    );
  }

  Future<void> storeDataInFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('schoolrequests').add({
        'exerciseBooks': int.parse(exerciseBooksController.text),
        'form1Textbooks': int.parse(form1TextbooksController.text),
        'form2Textbooks': int.parse(form2TextbooksController.text),
        'form3Textbooks': int.parse(form3TextbooksController.text),
        'form4Textbooks': int.parse(form4TextbooksController.text),
        'labEquipment': int.parse(labEquipmentController.text),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Data submitted successfully!'),
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (e) {
      print('Error storing data in Firestore: $e');
    }
  }
}
