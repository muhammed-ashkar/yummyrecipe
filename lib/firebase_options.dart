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
    apiKey: 'AIzaSyBBHYc7yzqMJANWAKdqvh7SaFTXWxFWqF4',
    appId: '1:264102334731:web:802dfdca374d04d40e920e',
    messagingSenderId: '264102334731',
    projectId: 'yummyrecipe-32af9',
    authDomain: 'yummyrecipe-32af9.firebaseapp.com',
    storageBucket: 'yummyrecipe-32af9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXGCIkvc8UghKJK2PDrg4jhXqx-OtRftg',
    appId: '1:264102334731:android:af6e1378e5bcd3e10e920e',
    messagingSenderId: '264102334731',
    projectId: 'yummyrecipe-32af9',
    storageBucket: 'yummyrecipe-32af9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEfh_jFwpnHqnSGTG-Z-w-j4ziwbPebZo',
    appId: '1:264102334731:ios:a36c3c0c1ccd0ed10e920e',
    messagingSenderId: '264102334731',
    projectId: 'yummyrecipe-32af9',
    storageBucket: 'yummyrecipe-32af9.appspot.com',
    iosBundleId: 'com.example.yummyrecipe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEfh_jFwpnHqnSGTG-Z-w-j4ziwbPebZo',
    appId: '1:264102334731:ios:a36c3c0c1ccd0ed10e920e',
    messagingSenderId: '264102334731',
    projectId: 'yummyrecipe-32af9',
    storageBucket: 'yummyrecipe-32af9.appspot.com',
    iosBundleId: 'com.example.yummyrecipe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBHYc7yzqMJANWAKdqvh7SaFTXWxFWqF4',
    appId: '1:264102334731:web:adbf0287d00d81420e920e',
    messagingSenderId: '264102334731',
    projectId: 'yummyrecipe-32af9',
    authDomain: 'yummyrecipe-32af9.firebaseapp.com',
    storageBucket: 'yummyrecipe-32af9.appspot.com',
  );

}