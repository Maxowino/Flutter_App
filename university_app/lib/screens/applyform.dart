import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntryForm extends StatefulWidget {
  const DataEntryForm({super.key});

  @override
  _DataEntryFormState createState() => _DataEntryFormState();
}

class _DataEntryFormState extends State<DataEntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  String? _selectedUniversity;
  String? _selectedCourse;

  final List<String> universities = ['University of Nairobi', 'University of Oxford', 'Massachusetts Institute of Technology', 'Strathmore University', 'Colorado State University', 'Laurier University', 'University of Cape Town', 'Mansoura University'];

  final List<String> courses = [
    'Accounting',
    'Aeronautical Science',
    'Bachelor of Commerce',
    'Biology',
    'Business Information Technology',
    'Computer Science',
    'Law',
    'Mathematics',
    'Mechanical Engineering',
    'Medicine',
    'Nursing',
    'Philosophy'
  ];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('Form-Application').add({
        'name': _nameController.text,
        'location': _locationController.text,
        'school': _schoolController.text,
        'university': _selectedUniversity,
        'course': _selectedCourse,
      });
      _formKey.currentState!.reset();
    }
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Data submitted successfully!'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Application",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _schoolController,
                decoration: const InputDecoration(labelText: 'School'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your school';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedUniversity,
                decoration: const InputDecoration(labelText: 'University Choice'),
                items: universities.map((String university) {
                  return DropdownMenuItem<String>(
                    value: university,
                    child: Text(university),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUniversity = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a university';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCourse,
                decoration: const InputDecoration(labelText: 'Course Choice'),
                items: courses.map((String course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCourse = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose your course';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
              minimumSize:const Size(180,50),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              side: BorderSide.none
            ),
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
