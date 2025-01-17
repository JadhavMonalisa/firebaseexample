// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC_1rxEfMvcXJXEIadrXUjiLoHuvQI4ZBk',
    appId: '1:680749763383:web:89b46a608edc49b31c68b2',
    messagingSenderId: '680749763383',
    projectId: 'fir-example-70365',
    authDomain: 'fir-example-70365.firebaseapp.com',
    storageBucket: 'fir-example-70365.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgyrZhtPZ73foOZEd-iGY5PHxkoeTqgtU',
    appId: '1:680749763383:android:96dd994cc24646041c68b2',
    messagingSenderId: '680749763383',
    projectId: 'fir-example-70365',
    storageBucket: 'fir-example-70365.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD9dECMsQEInVc8xw4hmt5gYkYQNNoZWA',
    appId: '1:680749763383:ios:0c4cf752b9a945fc1c68b2',
    messagingSenderId: '680749763383',
    projectId: 'fir-example-70365',
    storageBucket: 'fir-example-70365.appspot.com',
    iosBundleId: 'com.example.firebaseexample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDD9dECMsQEInVc8xw4hmt5gYkYQNNoZWA',
    appId: '1:680749763383:ios:0c4cf752b9a945fc1c68b2',
    messagingSenderId: '680749763383',
    projectId: 'fir-example-70365',
    storageBucket: 'fir-example-70365.appspot.com',
    iosBundleId: 'com.example.firebaseexample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_1rxEfMvcXJXEIadrXUjiLoHuvQI4ZBk',
    appId: '1:680749763383:web:7f2580742de7420c1c68b2',
    messagingSenderId: '680749763383',
    projectId: 'fir-example-70365',
    authDomain: 'fir-example-70365.firebaseapp.com',
    storageBucket: 'fir-example-70365.appspot.com',
  );
}
