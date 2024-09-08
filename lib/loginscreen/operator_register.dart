import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/operator_login.dart';
import 'package:fleet/loginscreen/user_login.dart';
import 'package:fleet/dashboard/secondpage.dart';
import 'package:flutter/material.dart';

class operatorRegister extends StatefulWidget {
  const operatorRegister({super.key});

  @override
  State<operatorRegister> createState() => _registerState();
}

class _registerState extends State<operatorRegister> {

  TextEditingController opname = TextEditingController();
  TextEditingController opemail = TextEditingController();
  TextEditingController oppassword = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(opemail.text.isNotEmpty && oppassword.text.isNotEmpty){

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
      backgroundColor: Color.fromARGB(255, 182, 222, 164),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(

            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Create Account - Operator Register",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: opname,
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
                    controller: opemail,
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
                    controller: oppassword,
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
                    backgroundColor: Color.fromARGB(255, 157, 226, 151),
                    fixedSize: Size(120, 30)
                                   ),
                     onPressed: () {
                       // save the info to the database and then direct to dash board
                       // if the field is empty
                       if (opemail.text.isEmpty && oppassword.text.isEmpty) {
                         registerUser();
                       }
                       else {
                         CollectionReference collRef = FirebaseFirestore.instance
                             .collection("OperatorData");
                         collRef.add({
                           'email': opemail.text,
                           'password': oppassword.text,
                         });
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => const operatorLogin()
                         ),
                         );
                       }
                     },
                    child: const Text("Register"),
                    ),
                    TextButton(
                      child: const Text("Already have an account? Sign In",
                      style: TextStyle(
                        fontSize: 15
                         ),
                         ),
                      onPressed: (){
                       Navigator.pop(context, MaterialPageRoute(builder: (context)=> const operatorLogin()),);
                      },
                      ),
              ],    
              ),
          ),
          ),
         ),
    );
  }
}

