import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrental/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // user 
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all users
  final userCollection = FirebaseFirestore.instance.collection("Users");

  //edit this feild
  Future<void>editField(String field) async{
    String newValue = "";
    await showDialog(context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text("Edit $field",
      style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter new $field",
          hintStyle: TextStyle(color: Colors.grey)
        ),
        onChanged: (value) {
          newValue = value;
        },
      ),
      actions: [
        //cancel btn
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(context),
           child: Text('Cancel',
           style: TextStyle(color: Colors.white), 
           )),

           //save btn

           //cancel btn
        TextButton(
          onPressed: ()=> Navigator.of(context).pop(newValue),
           child: Text('Save',
           style: TextStyle(color: Colors.white), 
           ))
      ],
    ),

   
    );

     //update in firestore
     if(newValue.trim().length>0){
      //only update if text feild has anything mo teng,
      await userCollection.doc(currentUser.email).update({field:newValue});

     }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Colors.blue,

      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            //get user data
           // final userData = snapshot.data!.data() as Map<String, dynamic>;
            
            return ListView(
              children: [
                Icon(Icons.person,
                size: 70,
                ),

                const SizedBox(height: 10,),



                //user email

                Text(currentUser.email!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 50,),

                // user details
                Padding(padding: const EdgeInsets.only(left: 25.0),
                child: Text('My Details',
                style: TextStyle(color: Colors.grey[600]),
                ),
                ),

                //username
                MyTextBox(text: 'username of user',
                sectionName: 'username',
                onPressed:() => editField('username')
                ),

                //bio
                MyTextBox(text:'bio',
                sectionName: 'Bio',
                onPressed:() => editField('bio')
                ),


                //rental vacancies



              ],
            );

          }else if(snapshot.hasError){
                  return Center(child: Text('Error${snapshot.error}'),);
                } return const Center(
                  child: CircularProgressIndicator(),
                );

        },
      ),
    );
  }
}