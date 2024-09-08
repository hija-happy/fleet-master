import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/user_login.dart';
import 'package:flutter/material.dart';

class userRegister extends StatefulWidget {
  const userRegister({super.key});

  @override
  State<userRegister> createState() => _userregisterState();
}

class _userregisterState extends State<userRegister> {
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  bool _isNotValidate = false;


  void registerUser() async{
    if(useremail.text.isNotEmpty && userpassword.text.isNotEmpty){

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
      backgroundColor: const Color.fromARGB(255, 164, 196, 222),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Create Account - User Register",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: username,
                    decoration: const InputDecoration(
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
                    controller: useremail,
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
                    controller: userpassword,
                    obscureText: true,
                       decoration: const InputDecoration(
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
                    backgroundColor: const Color.fromARGB(255, 192, 217, 228),
                    fixedSize: const Size(120,10)
                  ),
                    onPressed: () {
                      // save the info to the database and then direct to dash board
                      // if the field is empty
                      if (useremail.text.isEmpty && userpassword.text.isEmpty && username.text.isEmpty) {
                        registerUser();
                      }
                      else {
                        CollectionReference collRef = FirebaseFirestore.instance
                            .collection("UserData");
                        collRef.add({
                          'name':username.text,
                          'email': useremail.text,
                          'password': userpassword.text,
                        });
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const userLogin()
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const userLogin()),);
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

