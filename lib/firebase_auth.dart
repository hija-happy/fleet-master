
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkUserExists(String email, String password) async {
  // Reference to the "UserData" collection
  CollectionReference users = FirebaseFirestore.instance.collection('UserData');

  // Query to check if a user with the provided email and password exists
  QuerySnapshot querySnapshot = await users
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .get();

  // If the query has results, then the user exists
  return querySnapshot.docs.isNotEmpty;
}

Future<bool> checkOperatorExists(String email, String password) async {
  // Reference to the "UserData" collection
  CollectionReference users = FirebaseFirestore.instance.collection('OperatorData');

  // Query to check if a user with the provided email and password exists
  QuerySnapshot querySnapshot = await users
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .get();

  // If the query has results, then the user exists
  return querySnapshot.docs.isNotEmpty;
}

Future<bool> checkDriverExists(String email, String password) async {
  // Reference to the "UserData" collection
  CollectionReference users = FirebaseFirestore.instance.collection('DriverData');

  // Query to check if a user with the provided email and password exists
  QuerySnapshot querySnapshot = await users
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .get();

  // If the query has results, then the user exists
  return querySnapshot.docs.isNotEmpty;
}
