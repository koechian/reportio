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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDASkjQsA9tXJTipbKgwk3O6fPxMlGK7Pc',
    appId: '1:598809354707:web:88d8fdfa1a8cfe85a40f26',
    messagingSenderId: '598809354707',
    projectId: 'reportio-fc523',
    authDomain: 'reportio-fc523.firebaseapp.com',
    storageBucket: 'reportio-fc523.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCedZTof22o9uBzSI4BxSbhkJsvMQDnA38',
    appId: '1:598809354707:android:d2e5b0923e368944a40f26',
    messagingSenderId: '598809354707',
    projectId: 'reportio-fc523',
    storageBucket: 'reportio-fc523.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqlujoij8D-uFn1RxAZX-VOeSE4wEKZEY',
    appId: '1:598809354707:ios:e9451b5e0b02b196a40f26',
    messagingSenderId: '598809354707',
    projectId: 'reportio-fc523',
    storageBucket: 'reportio-fc523.appspot.com',
    iosClientId: '598809354707-gs27d2ce6g5e9hbkqf0i5l5b76ua2kvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.reportio',
  );
}
