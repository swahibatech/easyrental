import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrental/pages/landlord/tedits/models/req_model.dart';
import 'package:flutter/material.dart';

class MaintenaceReq extends StatelessWidget {
  const MaintenaceReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('maintainreq').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> items = [];
          snapshot.data!.docs.forEach((doc) {
            var req = MaintenanceRequest.fromMap(doc.data() as Map<String, dynamic>);
            items.add(
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(req.profileImage), // Use NetworkImage instead of AssetImage
                              fit: BoxFit.cover,
                          ),
                        ),

                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          req.name, // Replace with name from Firestore
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(req.description), // Replace with description from Firestore
                        const SizedBox(height: 16),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
          return Column(
            children: items,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
