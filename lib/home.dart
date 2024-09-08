import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/threelogin.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
   const Home({Key? key,
  
   });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isNotValidate = false;

  void saveUserData(String email, String password) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('BOOKDATA');
    await users.add({
      'email': email,
      'password': password,
    });

  
    
  // Show a SnackBar to acknowledge the user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Booked Successfully! We will connect you shortly'),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
  }

  void myQuery(String name, String password, String query) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Query');
    await users.add({
      'name': name,
      'email': password,
      'query': query,
    });


  // Show a SnackBar to acknowledge the user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Submitted Successfully'),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "SmartRouteX",
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.black),
        ),
      shadowColor: Colors.black,
       
        actions:[
          Center(
          
            child: Padding(
              
              padding: const EdgeInsets.all(15.0),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> const threelogin(),
                  ),
                  );
              }, icon: const Icon(Icons.person_add),
              color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            section1(),
            section2(),
            section3(),
            section4(),
          ],
        ),
      ),
    );
  }

  Widget section1 (){
    return Container(
      decoration: const BoxDecoration(
        color:  Colors.black,
        ),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       textBaseline: TextBaseline.alphabetic,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 100, 10),
              child: Text("Experience a Smarter Way to Manage Your Business's Fleet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BookForm( onSave: saveUserData,
              isNotValidated: isNotValidate,),
          ),
        ],
      ),
    );
  }

   

// SECTION 2 : Features
  Widget section2(){
    return Container(
              height: 1500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 154, 196, 238),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Features",
                    style: TextStyle(
                      fontSize: 40
                    ),
                    ),
                  ),
              
                  const SizedBox(height: 10),
              
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [ 
                           const Text("Bus Management"),
                           InkWell(
                          onTap: (){},
                          child: Image.asset("images/bus.jpg",
                          width: 300.0,
                          height: 300.0,
                          ),
                        ),
                    
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  
                   Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                     child: Card(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [ 
                          InkWell(
                            
                          onTap: (){},
                          child: Image.asset("images/communiaction.jpg",
                          width: 300.0,
                          height: 300.0,
                          ),
                        ),
                         
                         const Text("Trip Management")
                       
                        ],
                                       ),
                     ),
                   ),
    const SizedBox(height: 10,),
                   Padding(
                     padding:const EdgeInsets.fromLTRB(60, 0, 60, 0),
                     child: Card(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [ 
                        
                     
                           const Text("Driver Management"),
                            InkWell(
                          onTap: (){},
                          child: Image.asset("images/driver.jpg",
                           width: 300.0,
                          height: 300.0,
                          ),
                        ),
                        ],
                                       ),
                     ),
                   ),
                  const SizedBox(height: 10,),

                   Padding(
                     padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                     child: Card(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [ 
                           InkWell(
                          onTap: (){},
                          child: Image.asset("images/location.jpg",
                           width: 300.0,
                          height: 300.0,
                          ),
                        ),  
                     
                           const Text("Route Management")
                        ],
                                       ),
                     ),
                   ),
                ]
                ),
    );
  }
// SECTION 3 : Tabout us
  Widget section3(){
    return Container(
      height: 850,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 207, 214, 216)
              
              ),
             child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("About Us",
                  style: TextStyle(fontSize: 40),),
                ),
            SizedBox(height: 20,),
               Padding(
                 padding: EdgeInsets.fromLTRB(100, 29, 100, 29),
                 child: Text("""
In the fast-paced realm of fleet management, SmartRouteX stands as a beacon of innovation and efficiency. Our inception was fueled by the vision to revolutionize how businesses navigate the intricacies of fleet operations. Comprising a team of dedicated professionals, we have meticulously crafted a cutting-edge fleet management software that seamlessly integrates user-friendliness with robust functionality.

Our software is not just a tool; it's a dynamic solution designed to adapt to the ever-changing needs of modern enterprises. We understand the diversity of businesses, and our scalable approach ensures that whether you manage a small fleet or operate on an enterprise level, SmartX caters to your unique requirements. Real-time GPS tracking, fuel management, and automated maintenance scheduling are among the features that make SmartX a holistic solution for the entire fleet lifecycle.

What truly sets us apart is our unwavering commitment to innovation. We believe in staying ahead of industry trends, providing not only a current solution but also a future-proof investment for your fleet operations. Join us at the forefront of fleet management, where we re not just a software provider—it's a strategic partner in your journey to operational excellence.

At SmartRouteX, we go beyond providing a software solution; we empower businesses for success in the dynamic landscape of fleet management. Our commitment to user-friendly design, scalability, and continuous innovation ensures that your fleet operations are not just efficient today but are prepared for the challenges of tomorrow. Join us, and let SmartRouteX be your strategic ally in achieving streamlined, optimized, and future-ready fleet operations.
 """,
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.w300
                 ),
                   textAlign: TextAlign.justify,
                 ),
               )
              ]
              ),
    );
   }
  // SECTION 4 : Any Querys
Widget section4 (){
    return Container( 
      decoration: const BoxDecoration(
        color:  Colors.white ,
        ),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       textBaseline: TextBaseline.alphabetic,
        children: [

          Expanded(
            child: myqueryForm (),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 100, 10),
              child: Image.asset("images/query.jpg"),
            ),
          ),
        ],
      ),
    );
  }

   Widget myqueryForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,50,0),
      child: Column(
        children: [
          const Text("ANY QUERYS?",
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
           const Text("Contact Us ",
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.normal,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
          ),
          const SizedBox(height: 50),
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Name",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white )
            ),
          ),
          const SizedBox(height: 40),
          const TextField(
           decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white )
            ),
          ),

          const SizedBox(height: 40),

           const TextField(
           
            maxLines: 8,
           decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Tell us about your query",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white )
            ),
          ),
            const SizedBox(height: 40),
          Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                // Implement the action for the "Book Demo" button
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
class BookForm extends StatefulWidget {
  final Function(String, String) onSave;
  final bool isNotValidated;
  const BookForm({required this.onSave, required this.isNotValidated});
  @override
  _BookFormState createState() => _BookFormState();
}
class _BookFormState extends State<BookForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
      child: Column(
        children: [
          const Text(
            "Elevate your operations with intelligent fleet management. Unlock cost efficiencies, real-time insights, and safety measures. Foster sustainability, delight customers, and gain a competitive edge as a forward-thinking leader",
            style: TextStyle(color: Colors.grey, fontSize: 40),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 50),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 9, 10, 10),
              border: InputBorder.none,
              hintText: "Name",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white),
              errorText: widget.isNotValidated ? "Enter the proper info" : null,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 9, 10, 10),
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white),
              errorText: widget.isNotValidated ? "Enter the proper info" : null,
            ),
          ),
          const SizedBox(height: 60),
          Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // Validate the data before saving
                  bool isNotValidated =
                      nameController.text.isEmpty || emailController.text.isEmpty;

                  // If validated, save the data
                  if (!isNotValidated) {
                    widget.onSave(nameController.text, emailController.text);
                  }
                  // Update the parent widget with the validation state
                  widget.onSave(nameController.text, emailController.text);
                });
              },
              child: const Text('Book Demo'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyQueryForm extends StatefulWidget {
  final Function(String, String, String) onSave;
  final bool isNotValidated;

  const MyQueryForm({required this.onSave, required this.isNotValidated});

  @override
  _MyQueryFormState createState() => _MyQueryFormState();
}

class _MyQueryFormState extends State<MyQueryForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
      child: Column(
        children: [
          const Text(
            "ANY QUERYS?",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const Text(
            "Contact Us ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 50),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Name",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white),
              errorText: widget.isNotValidated ? "Enter the proper info" : null,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white),
              errorText: widget.isNotValidated ? "Enter the proper info" : null,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: queryController,
            maxLines: 8,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 186, 197, 197),
              border: InputBorder.none,
              hintText: "Tell us about your query",
              hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
              labelStyle: TextStyle(color: Colors.white),
              errorText: widget.isNotValidated ? "Enter the proper info" : null,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // Validate the data before saving
                  bool isNotValidated =
                      nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          queryController.text.isEmpty;

                  // If validated, save the data
                  if (!isNotValidated) {
                    widget.onSave(
                      nameController.text,
                      emailController.text,
                      queryController.text,
                    );

                    // Show acknowledgment (you can customize this part)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Query submitted successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }); 
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

