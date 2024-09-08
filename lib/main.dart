import 'package:firebase_core/firebase_core.dart';
import 'package:fleet/drivermangement/driver_info_updated.dart';
import 'package:fleet/drivermangement/testing_driver.dart';
import 'package:fleet/home.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
    );
  }
}

