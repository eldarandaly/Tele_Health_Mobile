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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOhXXD7ptdce6uGAEw_kfz6-8j6X2vFnU',
    appId: '1:189488264527:android:dbec3e13c745bf48d5413a',
    messagingSenderId: '189488264527',
    projectId: 'telehealthserver',
    databaseURL: 'https://telehealthserver-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'telehealthserver.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3sx5fa4deLyRc6l9g8ZGYvJAwBIyM90U',
    appId: '1:189488264527:ios:87de812d44fb3d90d5413a',
    messagingSenderId: '189488264527',
    projectId: 'telehealthserver',
    databaseURL: 'https://telehealthserver-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'telehealthserver.appspot.com',
    iosClientId: '189488264527-ikcf6rhqaerd2p3tg0em6m89njjotlbi.apps.googleusercontent.com',
    iosBundleId: 'com.example.telehealthcare',
  );
}