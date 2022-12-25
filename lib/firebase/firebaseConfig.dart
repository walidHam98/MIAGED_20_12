
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Android - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

//const app = initializeApp(firebaseConfig);

static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'AIzaSyBTkhvLaB_qd9Ub8omG9-E0hGHCiijuoU4',
  authDomain: 'miaged-e41e1.firebaseapp.com',
  databaseURL: 'https://miaged-e41e1-default-rtdb.europe-west1.firebasedatabase.app',
  projectId: 'miaged-e41e1',
  storageBucket: 'miaged-e41e1.appspot.com',
  messagingSenderId: '967756438513',
  appId: '1:967756438513:web:e9fbdf2e161059ccc04250',
);
}
