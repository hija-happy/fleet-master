import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/loginscreen/threelogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatefulWidget {
  
   const Home({Key? key,
  
   });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isNotValidate = false;
  bool _isHovered = false;
  List<bool> _isHoveredList = [false, false, false, false];

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
  backgroundColor: Colors.transparent,
  elevation: 0,  // Removes the shadow for a clean look
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF42A5F5), Color(0xFF90CAF9)], // Blue gradient background
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  title: const Text(
    "SmartRouteX",
    textAlign: TextAlign.start,
    style: TextStyle(
      color: Colors.white, // Matches the gradient for a better look
      fontWeight: FontWeight.bold,
      fontSize: 26, // Larger font for a modern touch
      letterSpacing: 1.5, // Improves readability
    ),
  ),
  actions: [
    Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0), // Adjusted padding for better alignment
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const threelogin(),
              ),
            );
          },
          icon: const Icon(Icons.person_add),
          iconSize: 30, // Slightly larger icon for modern look
          color: Colors.white, // White icon to match the modern gradient
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


Widget section2() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF90CAF9), Color(0xFF42A5F5)], // Softer blue gradient
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Features",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        // Decorative Divider
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(height: 40),

        // Cards with modern design
        _buildAnimatedCard(
          title: "Bus Management",
          imagePath: "images/bus.jpg",
          index: 0,
        ),
        _buildAnimatedCard(
          title: "Trip Management",
          imagePath: "images/communiaction.jpg",
          index: 1,
        ),
        _buildAnimatedCard(
          title: "Driver Management",
          imagePath: "images/driver.jpg",
          index: 2,
        ),
        _buildAnimatedCard(
          title: "Route Management",
          imagePath: "images/location.jpg",
          index: 3,
        ),
      ],
    ),
  );
}

Widget _buildAnimatedCard({required String title, required String imagePath, required int index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    child: MouseRegion(
       onEnter: (_) => _onHover(true, index),
        onExit: (_) => _onHover(false, index),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 400),
        scale: _isHoveredList[index] ? 1.05 : 1.0,
        child: Card(
          elevation: 8,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ).animate().fadeIn(duration: 600.ms),
              ),
              const SizedBox(width: 30),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _onHover(bool isHovered, int index) {
  setState(() {
    _isHoveredList[index] = isHovered;
  });
}

// SECTION 3 : Tabout us
  Widget section3() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 240, 248, 255),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title with enhanced styling
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "About Us",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 51, 105, 255),
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Decorative Divider
        Container(
          width: 80,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(height: 30),

        // Body Text with better readability and formatting
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            """
In the fast-paced realm of fleet management, SmartRouteX stands as a beacon of innovation and efficiency. Our inception was fueled by the vision to revolutionize how businesses navigate the intricacies of fleet operations. Comprising a team of dedicated professionals, we have meticulously crafted a cutting-edge fleet management software that seamlessly integrates user-friendliness with robust functionality.

Our software is not just a tool; it's a dynamic solution designed to adapt to the ever-changing needs of modern enterprises. We understand the diversity of businesses, and our scalable approach ensures that whether you manage a small fleet or operate on an enterprise level, SmartX caters to your unique requirements. 

Real-time GPS tracking, fuel management, and automated maintenance scheduling are among the features that make SmartX a holistic solution for the entire fleet lifecycle.

What truly sets us apart is our unwavering commitment to innovation. We believe in staying ahead of industry trends, providing not only a current solution but also a future-proof investment for your fleet operations. Join us at the forefront of fleet management, where we are not just a software provider — we're a strategic partner in your journey to operational excellence.

At SmartRouteX, we empower businesses for success in the dynamic landscape of fleet management. Our commitment to user-friendly design, scalability, and continuous innovation ensures that your fleet operations are not just efficient today but are prepared for the challenges of tomorrow.
            """,
            style: TextStyle(
              fontSize: 20,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4A4A4A),
            ),
            textAlign: TextAlign.justify,
          ),
        ),

        const SizedBox(height: 20),

        // Call-to-action or conclusion statement
        const Text(
          "Join us, and let SmartRouteX be your strategic ally in achieving streamlined, optimized, and future-ready fleet operations.",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

 Widget section4() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.tealAccent, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: myQueryForm(),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("images/query.jpg"),
          ),
        ),
      ],
    ),
  );
}

Widget myQueryForm() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ANY QUERIES?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.normal,
            fontSize: 30,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 30),
        _buildTextField(hintText: "Name"),
        const SizedBox(height: 20),
        _buildTextField(hintText: "Email"),
        const SizedBox(height: 20),
        _buildTextField(
          hintText: "Tell us about your query",
          maxLines: 5,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {
              // Implement the action for the "Submit" button
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.tealAccent,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTextField({required String hintText, int maxLines = 1}) {
  return TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600]),
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


class Section2 extends StatefulWidget {
  @override
  _Section2State createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              "Features",
              style: TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(height: 10),
          _buildAnimatedCard(
            title: "Bus Management",
            imagePath: "images/bus.jpg",
          ),
          const SizedBox(height: 10),
          _buildAnimatedCard(
            title: "Trip Management",
            imagePath: "images/communiaction.jpg",
          ),
          const SizedBox(height: 10),
          _buildAnimatedCard(
            title: "Driver Management",
            imagePath: "images/driver.jpg",
          ),
          const SizedBox(height: 10),
          _buildAnimatedCard(
            title: "Route Management",
            imagePath: "images/location.jpg",
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard({required String title, required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: _isHovered ? 1.05 : 1.0,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image.asset(
                    imagePath,
                    width: 300.0,
                    height: 300.0,
                  ).animate().fadeIn(duration: 500.ms),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
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


// // class MyQueryForm extends StatefulWidget {
// //   final Function(String, String, String) onSave;
// //   final bool isNotValidated;

// //   const MyQueryForm({required this.onSave, required this.isNotValidated});

// //   @override
// //   _MyQueryFormState createState() => _MyQueryFormState();
// // }

// // class _MyQueryFormState extends State<MyQueryForm> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController queryController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
// //       child: Column(
// //         children: [
// //           const Text(
// //             "ANY QUERYS?",
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontWeight: FontWeight.bold,
// //               fontSize: 50,
// //             ),
// //             textAlign: TextAlign.start,
// //           ),
// //           const SizedBox(height: 20),
// //           const Text(
// //             "Contact Us ",
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontWeight: FontWeight.normal,
// //               fontSize: 30,
// //             ),
// //             textAlign: TextAlign.start,
// //           ),
// //           const SizedBox(height: 50),
// //           TextField(
// //             controller: nameController,
// //             decoration: InputDecoration(
// //               filled: true,
// //               fillColor: Color.fromARGB(255, 186, 197, 197),
// //               border: InputBorder.none,
// //               hintText: "Name",
// //               hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
// //               labelStyle: TextStyle(color: Colors.white),
// //               errorText: widget.isNotValidated ? "Enter the proper info" : null,
// //             ),
// //           ),
// //           const SizedBox(height: 40),
// //           TextField(
// //             controller: emailController,
// //             decoration: InputDecoration(
// //               filled: true,
// //               fillColor: Color.fromARGB(255, 186, 197, 197),
// //               border: InputBorder.none,
// //               hintText: "Email",
// //               hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
// //               labelStyle: TextStyle(color: Colors.white),
// //               errorText: widget.isNotValidated ? "Enter the proper info" : null,
// //             ),
// //           ),
// //           const SizedBox(height: 40),
// //           TextField(
// //             controller: queryController,
// //             maxLines: 8,
// //             decoration: InputDecoration(
// //               filled: true,
// //               fillColor: Color.fromARGB(255, 186, 197, 197),
// //               border: InputBorder.none,
// //               hintText: "Tell us about your query",
// //               hintStyle: TextStyle(color: Color.fromARGB(255, 38, 44, 47)),
// //               labelStyle: TextStyle(color: Colors.white),
// //               errorText: widget.isNotValidated ? "Enter the proper info" : null,
// //             ),
// //           ),
// //           const SizedBox(height: 40),
// //           Container(
// //             alignment: Alignment.bottomLeft,
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   // Validate the data before saving
// //                   bool isNotValidated =
// //                       nameController.text.isEmpty ||
// //                           emailController.text.isEmpty ||
// //                           queryController.text.isEmpty;

// //                   // If validated, save the data
// //                   if (!isNotValidated) {
// //                     widget.onSave(
// //                       nameController.text,
// //                       emailController.text,
// //                       queryController.text,
// //                     );

// //                     // Show acknowledgment (you can customize this part)
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text('Query submitted successfully!'),
// //                         duration: Duration(seconds: 2),
// //                       ),
// //                     );
// //                   }
// //                 }); 
// //               },
// //               child: const Text('Submit'),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// }

