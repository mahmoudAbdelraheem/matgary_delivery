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
    apiKey: 'AIzaSyDCSMByW1uWqaNp2vRI32zp4S4cgds4wDw',
    appId: '1:686911501542:web:ef0ea9535033dcd76f7727',
    messagingSenderId: '686911501542',
    projectId: 'matgary-app-7b637',
    authDomain: 'matgary-app-7b637.firebaseapp.com',
    storageBucket: 'matgary-app-7b637.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB79vmLDaVlAhbfJwZ0gOHAPLd79ofggVA',
    appId: '1:686911501542:android:ffc226d405543bde6f7727',
    messagingSenderId: '686911501542',
    projectId: 'matgary-app-7b637',
    storageBucket: 'matgary-app-7b637.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsOFgbHciJ81oNsNldjtCM0M9A8jMmiLM',
    appId: '1:686911501542:ios:f7cdcbcd6ed9a8ab6f7727',
    messagingSenderId: '686911501542',
    projectId: 'matgary-app-7b637',
    storageBucket: 'matgary-app-7b637.appspot.com',
    iosBundleId: 'com.example.matgaryDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsOFgbHciJ81oNsNldjtCM0M9A8jMmiLM',
    appId: '1:686911501542:ios:6132cada96f18c5f6f7727',
    messagingSenderId: '686911501542',
    projectId: 'matgary-app-7b637',
    storageBucket: 'matgary-app-7b637.appspot.com',
    iosBundleId: 'com.example.matgaryDelivery.RunnerTests',
  );
}
