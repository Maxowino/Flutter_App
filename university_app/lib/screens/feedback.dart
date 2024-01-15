import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class feedback extends StatefulWidget {
  @override
  State<feedback> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<feedback> {
  TextEditingController feedbackController = TextEditingController(); // Controller for the feedback input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback and Suggestions",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Your Feedback will help us improve your experience with us ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: feedbackController,
                minLines: 2,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Enter your Suggestion and feedback',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    side: BorderSide.none),
                child: const Text('Send'),
                onPressed: () {     
                  storeFeedbackInFirestore();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> storeFeedbackInFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('feedback').add({
        'message': feedbackController.text,
        'timestamp': FieldValue.serverTimestamp(), // Include a timestamp
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Thank you for your Feedback!'),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 170,
          left: 40,
          right: 40,
        ),
      ));
    } catch (e) {
      print('Error storing feedback in Firestore: $e');
    }
  }
}
