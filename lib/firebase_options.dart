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
    apiKey: 'AIzaSyBMc4lpV_-IFZqlObxRdQhH_NtMlw7CQ_c',
    appId: '1:457047554936:web:8b09dd91ffaa3858cce68d',
    messagingSenderId: '457047554936',
    projectId: 'smarthomeapp-b0059',
    authDomain: 'smarthomeapp-b0059.firebaseapp.com',
    storageBucket: 'smarthomeapp-b0059.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARHE1JjWDwqlTMo5rtaZjKH799-bDZgsc',
    appId: '1:457047554936:android:553ef93ec2b4f24bcce68d',
    messagingSenderId: '457047554936',
    projectId: 'smarthomeapp-b0059',
    storageBucket: 'smarthomeapp-b0059.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHMvRg0_qmWRvGybfrKrt3JCVNYd5S1dE',
    appId: '1:457047554936:ios:3a40cea08fe311b8cce68d',
    messagingSenderId: '457047554936',
    projectId: 'smarthomeapp-b0059',
    storageBucket: 'smarthomeapp-b0059.appspot.com',
    androidClientId: '457047554936-qjbo3jfpds8pi51m9g31h1qqitedu4ev.apps.googleusercontent.com',
    iosClientId: '457047554936-2pug4s40sjpkk9r1j2i2bkrigtbm9gbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.doanMonhoc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHMvRg0_qmWRvGybfrKrt3JCVNYd5S1dE',
    appId: '1:457047554936:ios:3a40cea08fe311b8cce68d',
    messagingSenderId: '457047554936',
    projectId: 'smarthomeapp-b0059',
    storageBucket: 'smarthomeapp-b0059.appspot.com',
    androidClientId: '457047554936-qjbo3jfpds8pi51m9g31h1qqitedu4ev.apps.googleusercontent.com',
    iosClientId: '457047554936-2pug4s40sjpkk9r1j2i2bkrigtbm9gbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.doanMonhoc',
  );
}