import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/operator_register.dart';
import 'package:fleet/dashboard/secondpage.dart';
import 'package:flutter/material.dart';

import '../firebase_auth.dart';

class operatorLogin extends StatefulWidget {
  const operatorLogin({super.key});

  @override
  State<operatorLogin> createState() => _operatorLoginState();
}

class _operatorLoginState extends State<operatorLogin> {
  TextEditingController operatoremailcontroller = TextEditingController();
  TextEditingController operatorpasswordcontroller = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(operatoremailcontroller.text.isNotEmpty && operatorpasswordcontroller.text.isNotEmpty){

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
  void saveUserData(String email, String password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Clients');
    await users.add({
      'email': operatoremailcontroller.text,
      'password': operatorpasswordcontroller.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 182, 222, 164),
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
                const Text("Operator Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

                ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: operatoremailcontroller,
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
                    controller: operatorpasswordcontroller,
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
                      backgroundColor: Color.fromARGB(255, 157, 226, 151),
                      fixedSize: const Size(100, 30)
                  ),
                  onPressed: () async {
                    // Check if user exists in the database
                    bool userExists = await checkOperatorExists(operatoremailcontroller.text, operatorpasswordcontroller.text);

                    if (userExists) {
                      // Navigate to the dashboard if the user exists
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const dashBoard()));
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
                        operatorpasswordcontroller.clear();
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const operatorRegister() ),);
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

