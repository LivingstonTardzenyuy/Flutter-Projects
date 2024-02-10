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
    apiKey: 'AIzaSyC6fvrJ5PYIXEbjV6TnNRlZWWUpmlkYxWg',
    appId: '1:689019733021:web:12b853f49fbc091774f2f4',
    messagingSenderId: '689019733021',
    projectId: 'ecommerce-app-82178',
    authDomain: 'ecommerce-app-82178.firebaseapp.com',
    storageBucket: 'ecommerce-app-82178.appspot.com',
    measurementId: 'G-HBB2RYCTEC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFj7XKg2rmm1ltntzsZc0xOy7bLsMF60Q',
    appId: '1:689019733021:android:8bc75c7b1dc11cdb74f2f4',
    messagingSenderId: '689019733021',
    projectId: 'ecommerce-app-82178',
    storageBucket: 'ecommerce-app-82178.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6TUEIvmwVPH-qRa8t_NVTdFmU-m5jBFU',
    appId: '1:689019733021:ios:3a6bab8497df755174f2f4',
    messagingSenderId: '689019733021',
    projectId: 'ecommerce-app-82178',
    storageBucket: 'ecommerce-app-82178.appspot.com',
    iosBundleId: 'com.example.footclient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6TUEIvmwVPH-qRa8t_NVTdFmU-m5jBFU',
    appId: '1:689019733021:ios:8156aa5e3612896b74f2f4',
    messagingSenderId: '689019733021',
    projectId: 'ecommerce-app-82178',
    storageBucket: 'ecommerce-app-82178.appspot.com',
    iosBundleId: 'com.example.footclient.RunnerTests',
  );
}