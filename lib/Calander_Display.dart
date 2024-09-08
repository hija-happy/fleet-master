import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DisplayEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('maintenance_events').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No events available.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var event = snapshot.data!.docs[index].data() as Map<String, dynamic>?;

              if (event == null || event.isEmpty) {
                return SizedBox.shrink(); // Skip if no valid event data
              }

              return Card(
                child: ListTile(
                  title: Text('Title: ${event['eventTitle'] ?? 'N/A'}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Note: ${event['eventNote'] ?? 'N/A'}'),
                      Text('Duration: ${event['eventDuration'] ?? 'N/A'}'),
                      Text('Date & Time: ${_formatDateTime(event['dateTime'])}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDateTime(Timestamp? timestamp) {
    if (timestamp == null) {
      return 'N/A';
    }
    return DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate());
  }
}
