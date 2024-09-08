import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('BusInformation').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var vehicle = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text('Make: ${vehicle['make']}'),
                  subtitle: Text('Model: ${vehicle['model']}\nReg No: ${vehicle['registrationNumber']}\nSeating Capacity: ${vehicle['seatingCapacity']}\nOwner Name: ${vehicle['additionalInfo']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
