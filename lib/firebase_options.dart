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
    apiKey: 'AIzaSyBdTwrNlJPSIjTzr_XKAszTw9meQYNFGEg',
    appId: '1:314053425078:web:0def94626887e60ccb3317',
    messagingSenderId: '314053425078',
    projectId: 'introproject-9b9a3',
    authDomain: 'introproject-9b9a3.firebaseapp.com',
    storageBucket: 'introproject-9b9a3.firebasestorage.app',
    measurementId: 'G-LCDVEELNJ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVUVfHGcIcFejWBRm27so19Xp1KjaBNKY',
    appId: '1:314053425078:android:dcf21933740615f9cb3317',
    messagingSenderId: '314053425078',
    projectId: 'introproject-9b9a3',
    storageBucket: 'introproject-9b9a3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6LnVDzP9pecYIVcFk0fDV61vIxDBmdn0',
    appId: '1:314053425078:ios:c0b075f3dbab44a4cb3317',
    messagingSenderId: '314053425078',
    projectId: 'introproject-9b9a3',
    storageBucket: 'introproject-9b9a3.firebasestorage.app',
    iosClientId: '314053425078-40r9gmvsa59s0elmaifng3po32glc14t.apps.googleusercontent.com',
    iosBundleId: 'com.example.appForPractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6LnVDzP9pecYIVcFk0fDV61vIxDBmdn0',
    appId: '1:314053425078:ios:c0b075f3dbab44a4cb3317',
    messagingSenderId: '314053425078',
    projectId: 'introproject-9b9a3',
    storageBucket: 'introproject-9b9a3.firebasestorage.app',
    iosClientId: '314053425078-40r9gmvsa59s0elmaifng3po32glc14t.apps.googleusercontent.com',
    iosBundleId: 'com.example.appForPractice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdTwrNlJPSIjTzr_XKAszTw9meQYNFGEg',
    appId: '1:314053425078:web:11c53954cd971e03cb3317',
    messagingSenderId: '314053425078',
    projectId: 'introproject-9b9a3',
    authDomain: 'introproject-9b9a3.firebaseapp.com',
    storageBucket: 'introproject-9b9a3.firebasestorage.app',
    measurementId: 'G-R2FTBZ43ER',
  );
}
