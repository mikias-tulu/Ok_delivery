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
    apiKey: 'AIzaSyAWkLneiWYe4wiGeJiJ0Fy5h9HJZ3vmLuU',
    appId: '1:1011549064106:web:e1830e0af3dc888433b9d3',
    messagingSenderId: '1011549064106',
    projectId: 'ok-delivery-df295',
    authDomain: 'ok-delivery-df295.firebaseapp.com',
    storageBucket: 'ok-delivery-df295.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDajFu0H_4XZxDAJGkuEp2K1COB636j6Ew',
    appId: '1:1011549064106:android:18059896d871a3bf33b9d3',
    messagingSenderId: '1011549064106',
    projectId: 'ok-delivery-df295',
    storageBucket: 'ok-delivery-df295.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeDd2-HNW159b_TgTJXuAqc0VT89I7Oqk',
    appId: '1:1011549064106:ios:4e5081d1846c8bfc33b9d3',
    messagingSenderId: '1011549064106',
    projectId: 'ok-delivery-df295',
    storageBucket: 'ok-delivery-df295.appspot.com',
    iosClientId: '1011549064106-0an4m0tpdpuva2eagqbdkeuc811q2510.apps.googleusercontent.com',
    iosBundleId: 'com.example.okDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeDd2-HNW159b_TgTJXuAqc0VT89I7Oqk',
    appId: '1:1011549064106:ios:4e5081d1846c8bfc33b9d3',
    messagingSenderId: '1011549064106',
    projectId: 'ok-delivery-df295',
    storageBucket: 'ok-delivery-df295.appspot.com',
    iosClientId: '1011549064106-0an4m0tpdpuva2eagqbdkeuc811q2510.apps.googleusercontent.com',
    iosBundleId: 'com.example.okDelivery',
  );
}