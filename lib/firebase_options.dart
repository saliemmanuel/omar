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
    apiKey: 'AIzaSyDaM8v8PRrTgjuRfZN5Fp5AaGZjoA65KDo',
    appId: '1:855136747130:web:47a34754cf916f938885c3',
    messagingSenderId: '855136747130',
    projectId: 'ok-omardb',
    authDomain: 'ok-omardb.firebaseapp.com',
    storageBucket: 'ok-omardb.appspot.com',
    measurementId: 'G-3XJYKC2VXG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqtGg8Q0atYgmB8evCFe9ID9h7O8Bmt0o',
    appId: '1:855136747130:android:16bfbfed901365b98885c3',
    messagingSenderId: '855136747130',
    projectId: 'ok-omardb',
    storageBucket: 'ok-omardb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2poWzd-B4oXwUD74DFF-Yu8uxLeiGULs',
    appId: '1:855136747130:ios:147bab9602fd81118885c3',
    messagingSenderId: '855136747130',
    projectId: 'ok-omardb',
    storageBucket: 'ok-omardb.appspot.com',
    iosBundleId: 'com.marouait.omar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2poWzd-B4oXwUD74DFF-Yu8uxLeiGULs',
    appId: '1:855136747130:ios:ccd65141b4f451858885c3',
    messagingSenderId: '855136747130',
    projectId: 'ok-omardb',
    storageBucket: 'ok-omardb.appspot.com',
    iosBundleId: 'com.marouait.omar.RunnerTests',
  );
}
