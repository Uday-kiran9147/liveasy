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
    apiKey: 'AIzaSyAb_GytXLafgYTVRLto25eoGfBDgwwCnHY',
    appId: '1:804690395894:web:b5dc98513fe200c1ad22d7',
    messagingSenderId: '804690395894',
    projectId: 'flutternotes-97058',
    authDomain: 'flutternotes-97058.firebaseapp.com',
    databaseURL: 'https://flutternotes-97058-default-rtdb.firebaseio.com',
    storageBucket: 'flutternotes-97058.appspot.com',
    measurementId: 'G-CL0BQHVP30',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-xaREq-8AJAgYVOi1fj4T-Xs56Mx2Na8',
    appId: '1:804690395894:android:e97fb22ab0ae347fad22d7',
    messagingSenderId: '804690395894',
    projectId: 'flutternotes-97058',
    databaseURL: 'https://flutternotes-97058-default-rtdb.firebaseio.com',
    storageBucket: 'flutternotes-97058.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLbpJPf9Kc3C3YvMPbffgK5CIsEEm_IoU',
    appId: '1:804690395894:ios:9afa879cdafc9f71ad22d7',
    messagingSenderId: '804690395894',
    projectId: 'flutternotes-97058',
    databaseURL: 'https://flutternotes-97058-default-rtdb.firebaseio.com',
    storageBucket: 'flutternotes-97058.appspot.com',
    iosClientId: '804690395894-98igue68qetn4ot7ll7bsb28v0m2vcrc.apps.googleusercontent.com',
    iosBundleId: 'com.example.liveasy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLbpJPf9Kc3C3YvMPbffgK5CIsEEm_IoU',
    appId: '1:804690395894:ios:9afa879cdafc9f71ad22d7',
    messagingSenderId: '804690395894',
    projectId: 'flutternotes-97058',
    databaseURL: 'https://flutternotes-97058-default-rtdb.firebaseio.com',
    storageBucket: 'flutternotes-97058.appspot.com',
    iosClientId: '804690395894-98igue68qetn4ot7ll7bsb28v0m2vcrc.apps.googleusercontent.com',
    iosBundleId: 'com.example.liveasy',
  );
}