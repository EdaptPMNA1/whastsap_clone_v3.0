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
    apiKey: 'AIzaSyASlqXP1p3SGbK7E-iICgAqMw-CxxPUWFE',
    appId: '1:984079065874:web:2583f8333819c7262e09cb',
    messagingSenderId: '984079065874',
    projectId: 'notwhatsapp-1915f',
    authDomain: 'notwhatsapp-1915f.firebaseapp.com',
    databaseURL: 'https://notwhatsapp-1915f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notwhatsapp-1915f.appspot.com',
    measurementId: 'G-GSQN3QCT54',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAW2d0O6Q7VkY5P2WEAabUMOVN44TrBJtE',
    appId: '1:984079065874:android:6b308d7deae912e22e09cb',
    messagingSenderId: '984079065874',
    projectId: 'notwhatsapp-1915f',
    databaseURL: 'https://notwhatsapp-1915f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notwhatsapp-1915f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDI4nlpBZXH4BPSpZjnHIK2utq1CShS18w',
    appId: '1:984079065874:ios:a4251957baf696652e09cb',
    messagingSenderId: '984079065874',
    projectId: 'notwhatsapp-1915f',
    databaseURL: 'https://notwhatsapp-1915f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notwhatsapp-1915f.appspot.com',
    iosClientId: '984079065874-5q645rco7cdva64qkcr0g5vr92q6smnp.apps.googleusercontent.com',
    iosBundleId: 'com.example.notWhatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDI4nlpBZXH4BPSpZjnHIK2utq1CShS18w',
    appId: '1:984079065874:ios:2acbcc812503a42a2e09cb',
    messagingSenderId: '984079065874',
    projectId: 'notwhatsapp-1915f',
    databaseURL: 'https://notwhatsapp-1915f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notwhatsapp-1915f.appspot.com',
    iosClientId: '984079065874-dqo0cve5et7hpdag2uuuubomurumjmm2.apps.googleusercontent.com',
    iosBundleId: 'com.example.notWhatsapp.RunnerTests',
  );
}
