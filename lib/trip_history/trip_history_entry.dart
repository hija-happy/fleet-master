import 'package:fleet/trip_history/trip_history_display.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EnterTripInfoPage extends StatelessWidget {
  final TextEditingController busNumberController = TextEditingController();
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController arrivalTimeController = TextEditingController();
  final TextEditingController totalSeatsController = TextEditingController();
  final TextEditingController availableSeatsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Trip Information'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: busNumberController,
              decoration: InputDecoration(labelText: 'Bus Number'),
            ),
            TextField(
              controller: departureController,
              decoration: InputDecoration(labelText: 'Departure'),
            ),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: 'Destination'),
            ),
            TextField(
              controller: driverNameController,
              decoration: InputDecoration(labelText: 'Driver Name'),
            ),
            TextField(
              controller: departureTimeController,
              decoration: InputDecoration(labelText: 'Departure Time'),
            ),
            TextField(
              controller: arrivalTimeController,
              decoration: InputDecoration(labelText: 'Arrival Time'),
            ),
            TextField(
              controller: totalSeatsController,
              decoration: InputDecoration(labelText: 'Total Seats'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: availableSeatsController,
              decoration: InputDecoration(labelText: 'Available Seats'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveTripInfo(context);
              },
              child: Text('Save Trip Information'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayTripsPage()),
                );
              },
              child: Text('Display Trips'),
            ),
          ],
        ),
      ),
    );
  }

  void saveTripInfo(BuildContext context) {
    FirebaseFirestore.instance.collection('TripInformation').add({
      'busNumber': busNumberController.text,
      'departure': departureController.text,
      'destination': destinationController.text,
      'driverName': driverNameController.text,
      'departureTime': departureTimeController.text,
      'arrivalTime': arrivalTimeController.text,
      'totalSeats': int.tryParse(totalSeatsController.text) ?? 0,
      'availableSeats': int.tryParse(availableSeatsController.text) ?? 0,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Trip information saved successfully!'),
        ),
      );

      // Clear the text fields after saving
      busNumberController.clear();
      departureController.clear();
      destinationController.clear();
      driverNameController.clear();
      departureTimeController.clear();
      arrivalTimeController.clear();
      totalSeatsController.clear();
      availableSeatsController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
