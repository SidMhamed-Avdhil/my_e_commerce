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
    apiKey: 'AIzaSyAAUhxF9_NB_94AE7_s8N8oVEm1IxduRtk',
    appId: '1:766846864488:web:d46dfd4fa0f73ff43fffdd',
    messagingSenderId: '766846864488',
    projectId: 'medaspace-b03f4',
    authDomain: 'medaspace-b03f4.firebaseapp.com',
    storageBucket: 'medaspace-b03f4.appspot.com',
    measurementId: 'G-NLDR4N885D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSWfwA8q8DY3gSte51_CVoeLkIfn0ZFbA',
    appId: '1:766846864488:android:e56c69fcf459ac483fffdd',
    messagingSenderId: '766846864488',
    projectId: 'medaspace-b03f4',
    storageBucket: 'medaspace-b03f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArsnlzmsLOWtenuZiyA2hJpjfgn-s6ba8',
    appId: '1:766846864488:ios:9f033eeefa6763763fffdd',
    messagingSenderId: '766846864488',
    projectId: 'medaspace-b03f4',
    storageBucket: 'medaspace-b03f4.appspot.com',
    iosBundleId: 'com.example.myECommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArsnlzmsLOWtenuZiyA2hJpjfgn-s6ba8',
    appId: '1:766846864488:ios:09ba2505d58790993fffdd',
    messagingSenderId: '766846864488',
    projectId: 'medaspace-b03f4',
    storageBucket: 'medaspace-b03f4.appspot.com',
    iosBundleId: 'com.example.myECommerce.RunnerTests',
  );
}
