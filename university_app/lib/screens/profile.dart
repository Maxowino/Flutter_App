import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  bool showPassword = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? fullName = "";
  String? email = "";
  String? phoneNumber = "";
  String? course = "";
  String? password = "";
  String? username = "";

  @override
  void initState() {
    super.initState();
    // Fetch user data from Firestore when the widget initializes
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('Students').doc('your_user_id').get();

      // Update state variables with user data
      setState(() {
        
        email = documentSnapshot['email'];
        password = documentSnapshot['password'];
        phoneNumber = documentSnapshot['phone'];
        username = documentSnapshot['username'];
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Info"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                'My Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
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
                        // Use a placeholder image or default image URL
                        // You can replace the placeholder with your actual image URL
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.svgrepo.com%2Fsvg%2F437116%2Fperson-circle&psig=AOvVaw3bo9pkQjYAeAcUR8aG_RXN&ust=1698848352282000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIDWqbi9oIIDFQAAAAAdAAAAABAJ"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              buildTextField("Email", email ?? "", false),
              buildTextField("Phone Number", phoneNumber ?? "", false),
              buildTextField("Password", password ?? "", true),
              buildTextField("Username", username ?? "", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText, String placeholder, bool isShowPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isShowPassword ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isShowPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
