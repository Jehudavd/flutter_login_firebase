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
    apiKey: 'AIzaSyAa6g3DRGgD5Ivb7mp8HZNY6w4iRdLQsyI',
    appId: '1:733660619553:web:b5c6dbdb094ff570171460',
    messagingSenderId: '733660619553',
    projectId: 'course-net-e4c7b',
    authDomain: 'course-net-e4c7b.firebaseapp.com',
    storageBucket: 'course-net-e4c7b.appspot.com',
    measurementId: 'G-BMEV7HT114',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcM0R1kiqO56cvc8fzY8O74bGU1NLohyw',
    appId: '1:733660619553:android:465f49d66376c076171460',
    messagingSenderId: '733660619553',
    projectId: 'course-net-e4c7b',
    storageBucket: 'course-net-e4c7b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7FDU86-5D8GwPoMZaRmNAkaILl14w8vQ',
    appId: '1:733660619553:ios:d2d3d7022260ce77171460',
    messagingSenderId: '733660619553',
    projectId: 'course-net-e4c7b',
    storageBucket: 'course-net-e4c7b.appspot.com',
    iosBundleId: 'com.example.flutterLoginFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7FDU86-5D8GwPoMZaRmNAkaILl14w8vQ',
    appId: '1:733660619553:ios:d2d3d7022260ce77171460',
    messagingSenderId: '733660619553',
    projectId: 'course-net-e4c7b',
    storageBucket: 'course-net-e4c7b.appspot.com',
    iosBundleId: 'com.example.flutterLoginFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAa6g3DRGgD5Ivb7mp8HZNY6w4iRdLQsyI',
    appId: '1:733660619553:web:425b6c0bf82deab3171460',
    messagingSenderId: '733660619553',
    projectId: 'course-net-e4c7b',
    authDomain: 'course-net-e4c7b.firebaseapp.com',
    storageBucket: 'course-net-e4c7b.appspot.com',
    measurementId: 'G-XSWNMFPBRL',
  );
}