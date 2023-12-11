import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:university_app/screens/register.dart';
import 'package:university_app/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class studentlogin extends StatefulWidget {
  @override
  State<studentlogin> createState() => _studentloginState();
}

class _studentloginState extends State<studentlogin> {
  bool showpassword = true;
  bool checkedbox = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final slogindetails = GlobalKey<FormState>();
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 250,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Form(
            key: slogindetails,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle_sharp,
                  color: Colors.black,
                  size: 75.0,
                ),
                const Text('Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextFormField(
                    controller: user,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  your Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.person),
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Enter Your Email',
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  child: TextFormField(
                    obscureText: showpassword,
                    controller: pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showpassword = !showpassword;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: 'Enter Password',
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(180, 50),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      side: BorderSide.none,
                    ),
                    child: const Text('Login'),
                    onPressed: () async {
                      if (slogindetails.currentState!.validate()) {
                        try {
                          await _auth.signInWithEmailAndPassword(
                            email: user.text.trim(),
                            password: pass.text,
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Homepage()),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Login Successful!'),
                              backgroundColor: Colors.black,
                              duration: const Duration(seconds: 2),
                              dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height - 170,
                                left: 40,
                                right: 40,
                              ),
                            ),
                          );
                        } catch (e) {
                          print('Error signing in: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Invalid credentials. Please try again.'),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 3),
                               dismissDirection: DismissDirection.up,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height - 170,
                                left: 40,
                                right: 40,
                              ),
                              
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkedbox,
                      onChanged: (bool? ischecked) {
                        setState(() {
                          checkedbox = ischecked!;
                        });
                      },
                    ),
                    Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                                text: "Don't Have an Account? ",
                                style: TextStyle(color: Colors.black, fontSize: 14)
                            ),
                            TextSpan(
                                text: "Register Now",
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                                }
                            ),
                          ]
                      ))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
