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
    apiKey: 'AIzaSyDBHiO7RjJs4r2VWyBAUmrebqU_009OeAM',
    appId: '1:409658172153:web:4d9f2e85aeba36633df828',
    messagingSenderId: '409658172153',
    projectId: 'fir-notification-911c9',
    authDomain: 'fir-notification-911c9.firebaseapp.com',
    storageBucket: 'fir-notification-911c9.appspot.com',
    measurementId: 'G-Z9E0BD95QH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAIMmxQJ2V-4Vumyeo5woAY1_rU8X6-K8',
    appId: '1:409658172153:android:92d2402a955f711f3df828',
    messagingSenderId: '409658172153',
    projectId: 'fir-notification-911c9',
    storageBucket: 'fir-notification-911c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAihAkGizZEsqH26-O8m_z7XF8_6qZsCYU',
    appId: '1:409658172153:ios:cae5c5a4bffba47f3df828',
    messagingSenderId: '409658172153',
    projectId: 'fir-notification-911c9',
    storageBucket: 'fir-notification-911c9.appspot.com',
    iosBundleId: 'com.example.firebasenotification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAihAkGizZEsqH26-O8m_z7XF8_6qZsCYU',
    appId: '1:409658172153:ios:cae5c5a4bffba47f3df828',
    messagingSenderId: '409658172153',
    projectId: 'fir-notification-911c9',
    storageBucket: 'fir-notification-911c9.appspot.com',
    iosBundleId: 'com.example.firebasenotification',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBHiO7RjJs4r2VWyBAUmrebqU_009OeAM',
    appId: '1:409658172153:web:07562209e57773153df828',
    messagingSenderId: '409658172153',
    projectId: 'fir-notification-911c9',
    authDomain: 'fir-notification-911c9.firebaseapp.com',
    storageBucket: 'fir-notification-911c9.appspot.com',
    measurementId: 'G-CTMT47LT20',
  );
}
