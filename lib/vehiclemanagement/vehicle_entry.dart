import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vehicle_display.dart';

class EnterVehicleInfoPage extends StatelessWidget {
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController seatingCapacityController = TextEditingController();
  final TextEditingController additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Vehicle Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: makeController,
              decoration: InputDecoration(labelText: 'Make'),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: regNoController,
              decoration: InputDecoration(labelText: 'Registration Number'),
            ),
            TextField(
              controller: seatingCapacityController,
              decoration: InputDecoration(labelText: 'Seating Capacity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: additionalInfoController,
              decoration: InputDecoration(labelText: 'Owner Name'),
            ),
            SizedBox(height: 20),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveVehicleInfo(context); 
              },
              child: Text('Save Vehicle Information'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleDisplayPage()),
                );
              },
              child: Text('Display Vehicles'),
            ),
          ],
        ),
      ),
    );
  }

  void saveVehicleInfo(BuildContext context) {
    FirebaseFirestore.instance.collection('BusInformation').add({
      'make': makeController.text,
      'model': modelController.text,
      'registrationNumber': regNoController.text,
      'seatingCapacity': int.tryParse(seatingCapacityController.text) ?? 0,
      'additionalInfo': additionalInfoController.text,
    }).then((value) {
      // Show a Snackbar after successfully saving the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vehicle information saved successfully!'),
        ),
      );

      // Clear the text fields after saving
      makeController.clear();
      modelController.clear();
      regNoController.clear();
      seatingCapacityController.clear();
      additionalInfoController.clear();
    }).catchError((error) {
      // Show a Snackbar if an error occurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
