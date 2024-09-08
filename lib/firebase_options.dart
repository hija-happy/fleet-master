// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCw-J3oK2WEUQ4DZYN_bVkVUxt_8W0X47w',
    appId: '1:181106473114:web:080213de7478fde6678723',
    messagingSenderId: '181106473114',
    projectId: 'fleetmangement-265be',
    authDomain: 'fleetmangement-265be.firebaseapp.com',
    databaseURL: 'https://fleetmangement-265be-default-rtdb.firebaseio.com',
    storageBucket: 'fleetmangement-265be.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQpLo704tjrCY5NEdNEcrraoFtc-Z55bw',
    appId: '1:181106473114:android:2f5897cd7d972765678723',
    messagingSenderId: '181106473114',
    projectId: 'fleetmangement-265be',
    databaseURL: 'https://fleetmangement-265be-default-rtdb.firebaseio.com',
    storageBucket: 'fleetmangement-265be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7ZHmGa4-3bOzDoRDlU9uWNMxeCI62ExU',
    appId: '1:181106473114:ios:b90ada2bb32b1d6e678723',
    messagingSenderId: '181106473114',
    projectId: 'fleetmangement-265be',
    databaseURL: 'https://fleetmangement-265be-default-rtdb.firebaseio.com',
    storageBucket: 'fleetmangement-265be.appspot.com',
    iosBundleId: 'com.example.fleet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7ZHmGa4-3bOzDoRDlU9uWNMxeCI62ExU',
    appId: '1:181106473114:ios:c15e57d9c3884a01678723',
    messagingSenderId: '181106473114',
    projectId: 'fleetmangement-265be',
    databaseURL: 'https://fleetmangement-265be-default-rtdb.firebaseio.com',
    storageBucket: 'fleetmangement-265be.appspot.com',
    iosBundleId: 'com.example.fleet.RunnerTests',
  );
}
