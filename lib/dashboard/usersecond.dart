// ignore_for_file: use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet/Calander_Display.dart';
import 'package:fleet/drivermangement/driver_data_display.dart';
import 'package:fleet/map.dart';
import 'package:fleet/route_management/route_display.dart';
import 'package:fleet/trip_history/trip_history_display.dart';
import 'package:fleet/vehiclemanagement/vehicle_display.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fleet/bus_model.dart';
import 'package:flutter/material.dart';
import 'package:fleet/bustracker.dart';
import 'package:fleet/loginscreen/threelogin.dart';

// ignore: camel_case_types
class userDash extends StatefulWidget {
  const userDash({Key? key});
  @override
  State<userDash> createState() => _userDashState();
}

class _userDashState extends State<userDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Color.fromARGB(255, 255, 255, 255),
         title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text( 
              "SmartRouteX",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),     
      iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Drawer(
          shadowColor: Colors.black,
          child: ListView(
            children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple
                    ),
                  child: Text("WELCOME User"),
                  ),
                  ListTile(
                    title: const Text("Bus Tracking"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusTracker()));
                    },
                  ),
                  ListTile(
                    title: const Text("Route Management"),
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayRoutesScreen()));
                    },
                  ),
                  ListTile(
                    title: const Text("Driver Information"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverDataDisplay()));
                    },
                  ),
                  ListTile(
                    title: const Text("Vehicle Information"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleDisplayPage()));
                    },
                  ),
                  ListTile(
                    title: const Text("Trip History"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayTripsPage()));
                    },
                  ),

                    ListTile(
                    title: const Text("Live Map"),
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> MapWidget()));
                    },
                  ),
                  ListTile(
                    title: const Text("Log Out"),
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const threelogin()));
                    },
                  ),
            ],
            ),
            ),
      ),
          body: SingleChildScrollView(
            child: Column(
             children: [ 
                Container(
                
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color:Color.fromARGB(255, 213, 200, 211)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    
                    SizedBox(
                      
                      height:400,
                      width: 350,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayRoutesScreen()));
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 230, 134, 166),
                          child: Column(
                            children: [
                              const Text("Show Routes",
                              style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold
                              ),),
                               Image.asset("assets/route.png"),
                               ]
                               ),
                        ),
                      ),
                    ),
        

                    SizedBox(
                      height:400,
                      width: 350,
                      child: InkResponse(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DriverDataDisplay ()));
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 230, 134, 166),
                          child: Column(
                            children: [
                              Text("Show Driver",
                              style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold
                              ),
                              ),
                               Image.asset("assets/driver.png"),
                               ]
                               ),
                        ),
                      ),
                    ),
                  ],
                  ),
                ),

       Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color:Color.fromARGB(255, 213, 200, 211)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    SizedBox(
                      height:400,
                      width: 350,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleDisplayPage()));
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 230, 134, 166),
                          child: Column(
                            children: [
                              const Text("Show Vehicles",
                              style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold
                              ),),
                               Image.asset("assets/bus.png"),
                               ],
                               ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:400,
                      width: 350,
                      child: InkResponse(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayTripsPage ()));
                        },
                        child: Card(
                          color: Color.fromARGB(255, 230, 134, 166),
                          child: Column(
                            children: [
                              const Text("Show Trip History",
                              style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold
                              ),
                              ),
                               Image.asset("assets/trip.png"),
                               ]
                               ),
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
               Center(
                 child: Column(
                   children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0,20,0,20),
                      child: Text("Live Map",
                       style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.bold
                                ),
                                ),
                    ),
                     Container(       
                      alignment: Alignment.center,
                           width: 1000,
                           height: 700, // Adjust the height as needed
                           child: const HtmlWidget(
                             '''
                       <iframe
                         width="3000"
                         height="2000"
                         src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d31112.704841639134!2d74.8571!3d12.902056!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1701365588629!5m2!1sen!2sin"
                         frameborder="0"
                         style="border:0"
                         allowfullscreen
                       ></iframe>
                       <script>
                         // Example polyline
                         var coordinates = [
                           { lat: 12.90205575, lng: 74.8571 },
                           // Add more coordinates as needed
                         ];
                         var polyline = new google.maps.Polyline({
                           path: coordinates,
                           geodesic: true,
                           strokeColor: '#FF0000',
                           strokeOpacity: 1.0,
                           strokeWeight: 2
                         });
                         polyline.setMap(map);
                       </script>
                       <script>
                         // Example marker
                         var marker = new google.maps.Marker({
                           position: { lat: 12.90205575, lng: 74.8571 },
                           map: map,
                           title: 'Marker Title'
                         });
                       </script>
                       ''',
                           ),
                         ),
                   ],
                 ),
               )
              ],
            ),
          ),
    );
  }
}

  