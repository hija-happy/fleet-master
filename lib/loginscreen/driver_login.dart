import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fleet/driversecond.dart';
import 'package:fleet/loginscreen/driver_register.dart';
import 'package:fleet/dashboard/dashDriver.dart';
import 'package:flutter/material.dart';
import '../firebase_auth.dart';

class driverLogin extends StatefulWidget {
  const driverLogin({super.key});

  @override
  State<driverLogin> createState() => _driverLoginState();
}

class _driverLoginState extends State<driverLogin> {
  TextEditingController driveremailcontroller = TextEditingController();
  TextEditingController driverpasswordcontroller = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(driveremailcontroller.text.isNotEmpty && driverpasswordcontroller.text.isNotEmpty){

    }
    else{
      setState(() {
        _isNotValidate = true;
      }
      );
    }
  }

  //Function to save user data to Firebase
  // Function to save user data to Firestore
  void saveUserData(var email, var password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Clients');
    await users.add({
      'email': driveremailcontroller.text,
      'password': driverpasswordcontroller.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 224, 106),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Driver Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

                ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: driveremailcontroller,
                       decoration: const InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter Your Email",
                      prefixIcon: Icon(Icons.email_sharp),
                     
                      label: Text("Email"),
                      fillColor: Color.fromARGB(255, 183, 114, 114)
                      ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: driverpasswordcontroller,
                    obscureText: true,
                       decoration: const InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter the password",
                     
                      label: Text("Password"),
                       prefixIcon: Icon(Icons.lock),
                     
                      fillColor: Color.fromARGB(255, 183, 114, 114)
                      ),
                  ),
                ),
          
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromARGB(255, 244, 241, 147),
                    fixedSize: const Size(100, 30)
                  ),
                     onPressed: () async {
                       // Check if user exists in the database
                       bool userExists = await checkDriverExists(driveremailcontroller.text, driverpasswordcontroller.text);

                       if (userExists) {
                         // Navigate to the dashboard if the user exists
                         // ignore: use_build_context_synchronously
                         Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  driverDashboard()));
                       } else {
                         // Show an error message or handle invalid credentials
                         showDialog(
                           context: context,
                           builder: (BuildContext context) {
                             return AlertDialog(
                               title: const Text("Registration Required"),
                               content: const Text("It seems you are not registered. Please register to continue."),
                               actions: [
                                 TextButton(
                                   onPressed: () {
                                     // Close the dialog
                                     Navigator.of(context).pop();
                                   },
                                   child: const Text("OK"),
                                 ),
                               ],
                             );
                           },
                         );
                         // You may also want to clear the password field in case of an error
                         setState(() {
                           _isNotValidate = true;
                           driverpasswordcontroller.clear();
                         });
                       }
                     },
                     child: const Text("Sign In"),
                   ),
                    TextButton(
                      child: const Text("New User? Register",
                      style: TextStyle(
                        fontSize: 15
                         ),
                         ) ,
                      onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const driverRegister() ),);
                      },
                      )
              ],
              ),

          ),
          ),
         ),
    );
  }
}

