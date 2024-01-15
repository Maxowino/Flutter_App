import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:university_app/screens/studentlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController user = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 250,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_sharp,
                    color: Colors.black,
                    size: 75.0,
                  ),
                  const Text('Register', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  buildTextFormField(email, 'Enter Email', TextInputType.emailAddress, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an Email';
                    }
                    bool emailvalidate = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                    if (!emailvalidate) {
                      return "Enter a Valid Email";
                    }
                    return null;
                  }),
                  buildTextFormField(user, 'Enter Username', TextInputType.text, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Username';
                    }
                    return null;
                  }),
                  buildTextFormField(phone, 'Enter Phone Number', TextInputType.phone, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Phone Number';
                    }
                    return null;
                  }),
                  buildTextFormField(pass, 'Enter Password', TextInputType.text, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Password';
                    } else if (pass.text.length < 6) {
                      return "Password Should be more than 6 characters long";
                    }
                    return null;
                  }, obscureText: showPassword),
                  buildElevatedButton(),
                  buildRichTextForLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
    TextEditingController controller,
    String labelText,
    TextInputType keyboardType,
    String? Function(String?)? validator, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: buildInputDecoration(labelText),
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      labelText: labelText,
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
        child: const Text('Register'),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
             showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            "Loading...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  ),
);

            try {
              UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                email: email.text,
                password: pass.text,
              );

              // Use the UID as the document ID in Firestore
              await FirebaseFirestore.instance.collection('Students').doc(userCredential.user?.uid).set({
                'email': email.text,
                'phone': phone.text,
                'password': pass.text,
                'username': user.text,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Registration Successful!'),
                  backgroundColor: Colors.black,
                  duration: const Duration(seconds: 3),
                  dismissDirection: DismissDirection.up,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 120,
                    left: 40,
                    right: 40,
                  ),
                ),
              );
            } catch (e) {
              print('Error registering user or adding data to Firestore: $e');
            }
          }
        },
      ),
    );
  }
  Widget buildRichTextForLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Already Have An Account? ",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            TextSpan(
              text: "Login",
              style: const TextStyle(color: Colors.white, fontSize: 14),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => studentlogin()));
                },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addDataToFirestore(String email, String phone, String pass, String user) async {
    CollectionReference registerReference = FirebaseFirestore.instance.collection('Students');

    await registerReference.add({'email': email, 'phone': phone, 'password': pass, 'username': user});
  }

  Future<UserCredential> registerStudent(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print("User registered successfully!");
      return userCredential;
    } catch (e) {
      print("Error registering user: $e");
      // You can handle specific error cases here if needed
      throw e;
    }
  }
}
