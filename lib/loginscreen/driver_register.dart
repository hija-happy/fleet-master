import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/driver_login.dart';
import 'package:fleet/dashboard/secondpage.dart';
import 'package:flutter/material.dart';

class driverRegister extends StatefulWidget {
  const driverRegister ({super.key});

  @override
  State<driverRegister > createState() => _driverregisterState();
}

class _driverregisterState extends State<driverRegister > {

  TextEditingController dname = TextEditingController();
  TextEditingController demail = TextEditingController();
  TextEditingController dpassword = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(demail.text.isNotEmpty && dpassword.text.isNotEmpty){

    }
    else{
      setState(() {
        _isNotValidate = true;
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 228, 224, 106),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Create Account - Driver Register",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dname,
                    decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter Your Name",
                      label: Text("Name"),
                      fillColor: Color.fromARGB(255, 183, 114, 114),
                      prefixIcon: Icon(Icons.person)
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: demail,
                       decoration: InputDecoration(
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
                    controller: dpassword,
                    obscureText: true,
                       decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                     ),
                     hintText: "Enter the password",
                     prefixIcon: Icon(Icons.lock),
                     
                      label: Text("Password"),
                      fillColor: Color.fromARGB(255, 183, 114, 114)
                      ),
                  ),
                ),
          
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(255, 244, 241, 147),

                    fixedSize: Size(120, 30)
                  ),
                     onPressed: () {
                       // save the info to the database and then direct to dash board
                       // if the field is empty
                       if (demail.text.isEmpty && dpassword.text.isEmpty) {
                         registerUser();
                       }
                       else {
                         CollectionReference collRef = FirebaseFirestore.instance
                             .collection("DriverData");
                         collRef.add({
                           'email': demail.text,
                           'password': dpassword.text,
                         });
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => driverLogin(),
                         ),
                         );
                       }
                     },
                     child: Text("Register"),
                    ),

                    TextButton(
                      child: const Text("Already have an account? Sign In",
                      style: TextStyle(
                        fontSize: 15
                         ),
                         ) ,
                      onPressed: (){
                       Navigator.pop(context, MaterialPageRoute(builder:(context)=>const driverLogin()),);
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

