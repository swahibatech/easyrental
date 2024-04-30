import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('applicationprop').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var application = snapshot.data!.docs[index];
                var name = application['name'];
                var location = application['location'];
                return ListTile(
                  title: Text(name),
                  subtitle: Text(location),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to see more details
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplicationDetailsPage(application: application)),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ApplicationDetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> application;

  ApplicationDetailsPage({required this.application});

  void deleteApplication(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('applicationprop')
        .doc(application.id)
        .delete();
    Navigator.pop(context); // Navigate back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(application['name']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Contact: ${application['location']}'),
          ),
          // Employment area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Employment Area: ${application['location']}'),
          ),
          // Average salary
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Average Salary: ${application['price']}'),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement book viewing functionality
                  },
                  child: Text('Book Viewing'),
                ),
                ElevatedButton(
                  onPressed: () => deleteApplication(context),
                  child: Text('Decline'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
