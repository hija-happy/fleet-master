import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayRoutesScreen extends StatefulWidget {
  @override
  _DisplayRoutesScreenState createState() => _DisplayRoutesScreenState();
}

class _DisplayRoutesScreenState extends State<DisplayRoutesScreen> {
  CollectionReference routesCollection =
      FirebaseFirestore.instance.collection('routes');

  List<Map<String, dynamic>> routes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await routesCollection.get() as QuerySnapshot<Map<String, dynamic>>;

      setState(() {
        routes = snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
          return doc.data()!;
        }).toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> groupedRoutes = groupRoutesByBusNumber();

    return Scaffold(
      appBar: AppBar(
        title: Text('Display Routes'),
      ),
      body: ListView(
        children: groupedRoutes.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bus Number: ${entry.key}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...entry.value.map((route) {
                return ListTile(
                  title: Text(route['destination']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Distance: ${route['distance']} km'),
                      Text('Start Time: ${route['startTime']}'),
                      Text('End Time: ${route['endTime']}'),
                    ],
                  ),
                );
              }).toList(),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> groupRoutesByBusNumber() {
    Map<String, List<Map<String, dynamic>>> groupedRoutes = {};

    for (var route in routes) {
      String busNumber = route['busNumber'];

      if (groupedRoutes.containsKey(busNumber)) {
        groupedRoutes[busNumber]!.add(route);
      } else {
        groupedRoutes[busNumber] = [route];
      }
    }

    return groupedRoutes;
  }
}
