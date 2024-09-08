import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class BusTracker extends StatefulWidget {
  @override
  _BusTrackerState createState() => _BusTrackerState();
}

class _BusTrackerState extends State<BusTracker> {
  final DatabaseReference _busLocationRef =
  FirebaseDatabase.instance.ref().child('bus_location');

  Map<String, dynamic> busLocation = {};

  @override
  void initState() {
    super.initState();
    _busLocationRef.onValue.listen((event) {
      final dynamic snapshotValue = event.snapshot.value;
      if (snapshotValue != null && snapshotValue is Map) {
        setState(() {
          busLocation = Map<String, dynamic>.from(snapshotValue);
        });
      } else {
        // Handle null or unexpected snapshot value
        print('Error: Invalid or null snapshot value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Fleet Management'),
        elevation: 0,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildInfoCard(
              title: 'Bus ID',
              value: 'Bus-123',
              icon: Icons.directions_bus,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            buildInfoCard(
              title: 'Latitude',
              value: busLocation['latitude']?.toString() ?? 'N/A',
              icon: Icons.location_on,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            buildInfoCard(
              title: 'Longitude',
              value: busLocation['longitude']?.toString() ?? 'N/A',
              icon: Icons.map,
              color: Colors.orange,
            ),
            // Add more cards for additional information if needed
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(icon, color: Colors.white),
      ),
    );
  }
}
