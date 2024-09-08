import 'package:fleet/Calander_Display.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalanderEntry extends StatefulWidget {
  @override
  _CalanderEntryState createState() => _CalanderEntryState();
}

class _CalanderEntryState extends State<CalanderEntry> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController _eventTitleController = TextEditingController();
  TextEditingController _eventNoteController = TextEditingController();
  TextEditingController _eventDurationController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List> _events = {};

  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('maintenance_events');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Maintenance Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              calendarFormat: _calendarFormat,
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: _selectedDate,
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: (date, events) {
                setState(() {
                  _selectedDate = date;
                });
              },
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (_selectedDate != null)
              Text(
                'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                style: TextStyle(fontSize: 16.0),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _selectTime(context);
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 16.0),
            if (_selectedTime != null)
              Text(
                'Selected Time: ${_selectedTime.format(context)}',
                style: TextStyle(fontSize: 16.0),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showEventDialog();
              },
              child: Text('Add Event'),
            ),

 SizedBox(height: 16.0),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayEventsPage(),
      ),
    );
  },
  child: Text('Display Events'),
),

          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _showEventDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Event Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _eventTitleController,
                  decoration: InputDecoration(labelText: 'Event Title'),
                ),
                TextField(
                  controller: _eventNoteController,
                  decoration: InputDecoration(labelText: 'Event Note'),
                ),
                TextField(
                  controller: _eventDurationController,
                  decoration: InputDecoration(labelText: 'Event Duration'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveEvent();
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Save Event'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveEvent() {
    final selectedDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final eventTitle = _eventTitleController.text;
    final eventNote = _eventNoteController.text;
    final eventDuration = _eventDurationController.text;

    // Check if eventsCollection is not null
    if (eventsCollection != null) {
      // Save event to Firestore
      eventsCollection.add({
        'eventTitle': eventTitle,
        'eventNote': eventNote,
        'eventDuration': eventDuration,
        'dateTime': selectedDateTime,
      }).then((_) {
        // Update events for the selected date
        if (_events[_selectedDate] == null) {
          _events[_selectedDate] = [];
        }
        _events[_selectedDate]!.add(selectedDateTime);

        // Clear text fields
        _eventTitleController.clear();
        _eventNoteController.clear();
        _eventDurationController.clear();
      }).catchError((error) {
        // Handle the error, e.g., show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save event: $error'),
          ),
        );
      });
    }
  }
}
