import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DriverDataDisplay extends StatelessWidget {
  final CollectionReference driversCollection =
      FirebaseFirestore.instance.collection('DriverInformation');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Data Display'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: driversCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Display driver data in a ListView
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var driverData = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Name: ${driverData['Name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('License Number: ${driverData['LicenseNumber']}'),
                      Text('Phone Number: ${driverData['PhoneNumber']}'),
                      Text('Email: ${driverData['Email']}'),
                      Text(
                          'Driving Experience: ${driverData['DrivingExperience']}'),
                    ],
                  ),
                  // Add more ListTile customization as needed
                ),
              );
            },
          );
        },
      ),
    );
  }
}
