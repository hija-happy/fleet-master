import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'driver_data_display.dart';

class DriverEntryPage extends StatefulWidget {
  @override
  _DriverEntryPageState createState() => _DriverEntryPageState();
}

class _DriverEntryPageState extends State<DriverEntryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController drivingExperienceController = TextEditingController();

  CollectionReference driversCollection =
  FirebaseFirestore.instance.collection('DriverInformation');

  void addDriver() async {
    String name = nameController.text;
    String licenseNumber = licenseNumberController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String drivingExperience = drivingExperienceController.text;

    // Validate input before adding a new driver
    if (name.isNotEmpty &&
        licenseNumber.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        email.isNotEmpty &&
        drivingExperience.isNotEmpty) {
      // Add driver data to Firestore
      await driversCollection.add({
        'Name': name,
        'LicenseNumber': licenseNumber,
        'PhoneNumber': phoneNumber,
        'Email': email,
        'DrivingExperience': drivingExperience,
      });

      // Clear the text fields after adding a new driver
      nameController.clear();
      licenseNumberController.clear();
      phoneNumberController.clear();
      emailController.clear();
      drivingExperienceController.clear();
    }

    // Provide feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Driver added successfully!'),
      ),
    );
  }

  // Function to delete a driver
  void deleteDriver(DocumentSnapshot document) async {
    await driversCollection.doc(document.id).delete();
  }


// navigate 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: licenseNumberController,
              decoration: InputDecoration(labelText: 'License Number'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: drivingExperienceController,
              decoration: InputDecoration(labelText: 'Driving Experience'),
            ),
            SizedBox(height: 16.0),
              
            ElevatedButton(
              onPressed: () {
                addDriver();
              },
              child: Text('Add Driver'),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverDataDisplay()),
                );
              },
              child: Text('Display Drivers'),
            ),
          ],
        ),
      ),
    );
  }
}
