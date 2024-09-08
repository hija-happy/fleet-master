import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'driver_data_display.dart';
import 'package:email_validator/email_validator.dart';


class TestingDriver extends StatefulWidget {
  @override
  _TestingDriverState createState() => _TestingDriverState();
}
class _TestingDriverState extends State<TestingDriver> {
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController drivingExperienceController = TextEditingController();
  bool _isNotValidate = false;

  CollectionReference driversCollection =
  FirebaseFirestore.instance.collection('TestingDriverInfo');

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


  

  void _emailvalidate() async{
    
                  if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(emailController.text)) {
                    
                  }
    else{
      setState(() {
        _isNotValidate = true;
      }
      );
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name.';
    }
    return null;
  }

  String? validateLicenseNumber(String drivingExperienceController) {
    if (drivingExperienceController.isEmpty) {
     
    }
    else{
      setState(() {
        _isNotValidate = true;
      }
      );
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
    // You can add additional phone number validation if needed
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address.';
    } else if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validateDrivingExperience(String value) {
    if (value.isEmpty) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Validation Error'),
            content: Text('Please enter driving experience.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
     
    // You can add additional validation rules for driving experience if needed
    return null;
  }
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
                validator:(value) => validateName(value!),
              ),
              TextFormField(
                controller: licenseNumberController,
                decoration: InputDecoration(labelText: 'License Number'),
                validator:(value) => validateLicenseNumber(value!),
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
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(labelText: 'Email',
  errorText : _isNotValidate?"Enter the proper info ": null,
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Check if the entered email is in a valid format
    if (!RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  },
),
              TextFormField(
                controller: drivingExperienceController,
                decoration: InputDecoration(labelText: 'Driving Experience'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator:(value) => validateDrivingExperience(value!),
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
      ),
    );
  }
  
}
