import 'package:fleet/loginscreen/driver_login.dart';
import 'package:fleet/loginscreen/operator_login.dart';
import 'package:fleet/loginscreen/user_login.dart';
import 'package:flutter/material.dart';

class threelogin extends StatefulWidget {
  const threelogin({super.key});

  @override
  State<threelogin> createState() => _threeloginState();
}

class _threeloginState extends State<threelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 132, 206) ,  body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Register",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                ),


                SizedBox(height: 50,width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 154, 155, 197), //background color of button
                      side: const BorderSide(width:2, color:Colors.blueGrey), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                      ),
                      padding: const EdgeInsets.all(20) //content padding inside button
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const userLogin()));
                    },
                     child: const Text("User Login",
                     style: TextStyle(
                      fontSize:18
                       ),
                       )
                     ),
                ),


                  SizedBox(height: 50,width: 400,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 154, 155, 197), //background color of button
                    side: const BorderSide(width:2, color:Colors.blueGrey), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.all(20) //content padding inside button
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const driverLogin() ));
                    },
                     child: const Text("Driver Login",
                      style: TextStyle(
                      fontSize:18
                       ),
                       )
                     ),
                  ),
              SizedBox(height: 50,width: 400,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 154, 155, 197), //background color of button
                    side: const BorderSide(width:2, color:Colors.blueGrey), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.all(20) //content padding inside button
                    ),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const operatorLogin() ));
                    },
                     child: const Text("Operator Login",
                      style: TextStyle(
                      fontSize:18
                       ),
                     )
                     ),
              ),
               
               
              ],
              ),
          ),
          ),
         ),
    );
  }
}