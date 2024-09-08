import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayTripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips List'),
      ),
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('TripInformation').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var trip = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text('Bus Number: ${trip['busNumber']}'),
                  subtitle: Text('From ${trip['departure']} to ${trip['destination']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
