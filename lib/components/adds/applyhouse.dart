import 'package:easyrental/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class AddApplication extends StatefulWidget {
  const AddApplication({Key? key}) : super(key: key);

  @override
  State<AddApplication> createState() => _AddApplicationState();
}

class _AddApplicationState extends State<AddApplication> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();

  CollectionReference _reference = FirebaseFirestore.instance.collection('applicationprop'); // Collection reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.apartment,
                size: 100,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(hintText: 'Enter Your Name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerLocation,
                decoration: InputDecoration(hintText: 'Employer/employment Role'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the place of work';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerPrice,
                decoration: InputDecoration(hintText: 'Enter Average Salary'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Salary';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              MyButton(
                onTap: _addApplication, 
                text: 'Apply for Property',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addApplication() {
    if (_controllerName.text.isNotEmpty &&
        _controllerLocation.text.isNotEmpty &&
        _controllerPrice.text.isNotEmpty) {
      // Create a Map of application data
      Map<String, dynamic> applicationData = {
        'name': _controllerName.text,
        'location': _controllerLocation.text,
        'price': double.parse(_controllerPrice.text),
      };

      // Add the application to Firestore
      _reference.add(applicationData).then((value) {
        // Successfully added application
        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Application submitted successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    // Clear text fields
                    _controllerName.clear();
                    _controllerLocation.clear();
                    _controllerPrice.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        // Error occurred while adding application
        // Show error dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Failed to submit application: $error"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
    } else {
      // Show error message if any of the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill in all fields'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
