import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/dashboard/usersecond.dart';

import 'package:fleet/loginscreen/user_register.dart';

import 'package:flutter/material.dart';
import '../firebase_auth.dart';

class userLogin extends StatefulWidget {
  const userLogin({super.key});


  @override
  State<userLogin> createState() => _userloginState();
}

class _userloginState extends State<userLogin> {
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(useremailcontroller.text.isNotEmpty && userpasswordcontroller.text.isNotEmpty){
      
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
    'email': useremailcontroller.text,
     'password': userpasswordcontroller.text,
 });

  

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 196, 222),
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
                const Text("User Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

                ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: useremailcontroller,
                    keyboardType: TextInputType.text,
                    
                       decoration: InputDecoration(
                            errorText: _isNotValidate?"Enter the proper info ": null,
                     enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter Your Email",
                      prefixIcon: const Icon(Icons.email_sharp),
                      label: const Text("Email"),
                      fillColor: const Color.fromARGB(255, 183, 114, 114)
                      ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: userpasswordcontroller,
                    obscureText: true,
                       decoration: InputDecoration(
                        errorText: _isNotValidate?"Enter the proper info ": null,
                     enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter the password",
                      label: const Text("Password"),
                       prefixIcon: const Icon(Icons.lock),
                     
                      fillColor: const Color.fromARGB(255, 183, 114, 114)
                      ),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
backgroundColor: const Color.fromARGB(255, 192, 217, 228),
                  ),
                  onPressed: () async {
                    // Check if user exists in the database
                    bool userExists = await checkUserExists(useremailcontroller.text, userpasswordcontroller.text);

                    if (userExists) {
                      // Navigate to the dashboard if the user exists
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const userDash()));
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
                        userpasswordcontroller.clear();
                      });
                    }
                  },
                  child: const Text("Sign In"),
                ),

                    TextButton(
                      child: const Text("New User? Register!!!!!!!",
                      style: TextStyle(
                        fontSize: 15
                         ),
                         ) ,
                      onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const userRegister() ),);
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

