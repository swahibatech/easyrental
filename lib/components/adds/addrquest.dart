import 'dart:io';
import 'package:easyrental/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class AddRequest extends StatefulWidget {
  const AddRequest({Key? key}) : super(key: key);

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  
  String? imageName;
  String imageUrl = '';

  CollectionReference _reference = FirebaseFirestore.instance.collection('maintainreq'); // Collection reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.house_rounded,
                size: 100,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(hintText: 'Enter your Name'),
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
                decoration: InputDecoration(hintText: 'Enter Property Location'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the property location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerDescription,
                decoration: InputDecoration(hintText: 'Enter Damage Description'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the damage description';
                  }
                  return null;
                },
              ),
             
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

                      if (pickedImage != null) {
                        setState(() {
                          imageName = pickedImage.name;
                        });

                        // Upload image to Firebase Storage
                        Reference ref = FirebaseStorage.instance.ref().child('request_images').child(DateTime.now().millisecondsSinceEpoch.toString());
                        UploadTask uploadTask = ref.putFile(File(pickedImage.path));
                        uploadTask.whenComplete(() async {
                          // Get the download URL of the uploaded image
                          String downloadUrl = await ref.getDownloadURL();
                          setState(() {
                            imageUrl = downloadUrl;
                          });
                        });
                      }
                    },
                    icon: Icon(Icons.image),
                  ),
                  SizedBox(width: 10),
                  Text(imageName ?? 'No Image Selected'),
                ],
              ),
              MyButton(
                onTap: _addRequest, 
                text: 'Add Request',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addRequest() {
    if (_controllerName.text.isNotEmpty &&
        _controllerLocation.text.isNotEmpty &&
        _controllerDescription.text.isNotEmpty &&
        imageUrl.isNotEmpty) {
      // Create a Map of request data
      Map<String, dynamic> requestData = {
        'name': _controllerName.text,
        'location': _controllerLocation.text,
        'description': _controllerDescription.text,
        'image': imageUrl,
      };

      // Add the request to Firestore
      _reference.add(requestData).then((value) {
        // Successfully added request
        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Request added successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    // Clear text fields
                    _controllerName.clear();
                    _controllerLocation.clear();
                    _controllerDescription.clear();
                    // Reset image URL
                    setState(() {
                      imageUrl = '';
                      imageName = null;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        // Error occurred while adding request
        // Show error dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Failed to add request: $error"),
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
        content: Text('Please fill in all fields and upload an image'),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
