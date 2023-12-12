import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:university_app/screens/schoollogin.dart';

class schoolregister extends StatefulWidget {
  @override
  State<schoolregister> createState() => _SchoolRegisterState();
}

class _SchoolRegisterState extends State<schoolregister> {
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  String? selectedLocation;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Define a list of locations for the dropdown
  List<String> locations = [
    'Baringo',
    'Bomet',
    'Bungoma',
    'Busia',
    'Elgeyo-Marakwet',
    'Embu',
    'Garissa',
    'Homa Bay',
    'Isiolo',
    'Kajiado',
    'Kakamega',
    'Kericho',
    'Kiambu',
    'Kilifi',
    'Kirinyaga',
    'Kisii',
    'Kisumu',
    'Kitui',
    'Kwale',
    'Laikipia',
    'Lamu',
    'Machakos',
    'Makueni',
    'Mandera',
    'Marsabit',
    'Meru',
    'Migori',
    'Mombasa',
    'Murang\'a',
    'Nairobi',
    'Nakuru',
    'Nandi',
    'Narok',
    'Nyamira',
    'Nyandarua',
    'Nyeri',
    'Samburu',
    'Siaya',
    'Taita-Taveta',
    'Tana River',
    'Tharaka-Nithi',
    'Trans Nzoia',
    'Turkana',
    'Uasin Gishu',
    'Vihiga',
    'Wajir',
    'West Pokot',
  ];

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
                  buildTextFormField(
                    email,
                    'Enter Email',
                    TextInputType.emailAddress,
                    (value) {
                      // Validation logic for email
                      if (value == null || value.isEmpty) {
                        return 'Please enter an Email';
                      }
                      bool emailvalidate = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value);
                      if (!emailvalidate) {
                        return "Enter a Valid Email";
                      }
                      return null;
                    },
                  ),
                  // Replace the location text form field with a DropdownButtonFormField
                  buildLocationDropdown(),
                  buildTextFormField(
                    phone,
                    'Enter Phone Number',
                    TextInputType.phone,
                    (value) {
                      // Validation logic for phone number
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Phone Number';
                      }
                      return null;
                    },
                  ),
                  buildTextFormField(
                    pass,
                    'Enter Password',
                    TextInputType.text,
                    (value) {
                      // Validation logic for password
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      } else if (pass.text.length < 6) {
                        return "Password Should be more than 6 characters long";
                      }
                      return null;
                    },
                    obscureText: showPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
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
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: buildInputDecoration(labelText, suffixIcon: suffixIcon),
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }

  // Replace the location text form field with a DropdownButtonFormField
  Widget buildLocationDropdown() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: DropdownButtonFormField(
        value: selectedLocation,
        items: locations.map((location) {
          return DropdownMenuItem(
            value: location,
            child: Text(location),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedLocation = value as String?;
          });
        },
        decoration: buildInputDecoration('Select Your Location'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a Location';
          }
          return null;
        },
      ),
    );
  }

  InputDecoration buildInputDecoration(String labelText, {Widget? suffixIcon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      labelText: labelText,
      suffixIcon: suffixIcon,
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
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
              await FirebaseFirestore.instance.collection('Schools').doc(userCredential.user?.uid).set({
                'email': email.text,
                'phone': phone.text,
                'password': pass.text,
                'location': selectedLocation,
              });

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));

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
              style: TextStyle(color: Colors.white, fontSize: 14),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
