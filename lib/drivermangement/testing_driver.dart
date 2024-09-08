import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'driver_data_display.dart';
import 'package:email_validator/email_validator.dart';

class DummyDriver extends StatefulWidget {
  @override
  _DummyDriverState createState() => _DummyDriverState();
}

class _DummyDriverState extends State<DummyDriver> {
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController drivingExperienceController = TextEditingController();

  CollectionReference driversCollection =
      FirebaseFirestore.instance.collection('DummyDriverInfo');

  void addDriver() async {
    String name = nameController.text;
    String licenseNumber = licenseNumberController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String drivingExperience = drivingExperienceController.text;

    if (name.isNotEmpty &&
        licenseNumber.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        email.isNotEmpty &&
        drivingExperience.isNotEmpty) {
   
      await driversCollection.add({
        'Name': name,
        'LicenseNumber': licenseNumber,
        'PhoneNumber': phoneNumber,
        'Email': email,
        'DrivingExperience': drivingExperience,
      });

      nameController.clear();
      licenseNumberController.clear();
      phoneNumberController.clear();
      emailController.clear();
      drivingExperienceController.clear();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Driver added successfully!'),
      ),
    );
  }

  void deleteDriver(DocumentSnapshot document) async {
    await driversCollection.doc(document.id).delete();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name.';
    }
    return null;
  }

  String? validateLicenseNumber(String value) 
  {
    if (value.isEmpty)
    {
      return 'Please enter a license number.';
    }
    return null;
  }


  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a phone number.';
    }

    // Regular expression for a non-negative integer
    RegExp regex = RegExp(r'^\d+$');

    if (!regex.hasMatch(value)) {
      return 'Invalid input for driving experience.';
    }

    // Convert the input to an integer and check if it's within the valid range
    int experience = int.parse(value);
    if (experience < 0 || experience > 100) {
      return 'Driving experience must be between 0 and 100 years.';
    }

    return null;
  }
  String? validateEmail(String value) {
    if (value.isEmpty) 
    {
      return 'Please enter an email address.';
    }
     else if (!EmailValidator.validate(value))
    {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validateDrivingExperience(String value) {
    if (value.isEmpty) 
    {
      return 'Please enter driving experience.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => validateName(value!),
              ),
              TextFormField(
                controller: licenseNumberController,
                decoration: InputDecoration(labelText: 'License Number'),
                validator: (value) => validateLicenseNumber(value!),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number.';
                  }

                  if (value.length != 10) {
                    return 'Invalid phone number format. Must be 10 digits.';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress, // Set the keyboard type
                validator: (value) => validateEmail(value!),
              ),
              TextFormField(
                controller: drivingExperienceController,
                decoration: InputDecoration(labelText: 'Driving Experience'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (value) => validateDrivingExperience(value!),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context)!.validate()) {
                    addDriver();
                  }
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
      ),
    );
  }
}
