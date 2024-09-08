import 'package:fleet/route_management/route_display.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRouteScreen extends StatefulWidget {
  @override
  _AddRouteScreenState createState() => _AddRouteScreenState();
}

class _AddRouteScreenState extends State<AddRouteScreen> {
  TextEditingController distanceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();

  CollectionReference routesCollection =
      FirebaseFirestore.instance.collection('routes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: distanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Distance (km)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: 'Destination'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: startTimeController,
              decoration: InputDecoration(labelText: 'Start Time'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: endTimeController,
              decoration: InputDecoration(labelText: 'End Time'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: busNumberController,
              decoration: InputDecoration(labelText: 'Bus Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addRoute();
              },
              child: Text('Add Route'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayRoutesScreen()));
              },
              child: Text('Display Route'),
            ),
          ],
        ),
      ),
    );
  }

  void addRoute() async {
    double distance = double.tryParse(distanceController.text) ?? 0.0;
    String destination = destinationController.text;
    String startTime = startTimeController.text;
    String endTime = endTimeController.text;
    String busNumber = busNumberController.text;

    if (distance > 0 &&
        destination.isNotEmpty &&
        startTime.isNotEmpty &&
        endTime.isNotEmpty &&
        busNumber.isNotEmpty) {
      await routesCollection.add({
        'distance': distance,
        'destination': destination,
        'startTime': startTime,
        'endTime': endTime,
        'busNumber': busNumber,
      });

      // Clear input fields after adding route
      distanceController.clear();
      destinationController.clear();
      startTimeController.clear();
      endTimeController.clear();
      busNumberController.clear();

      // Display a message or navigate to another screen if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Route added successfully!'),
        ),
      );
    } else {
      // Display an error or handle invalid input
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
