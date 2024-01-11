import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBEhPuCCM_3Vyh2GF5vnJ0BiFjlhGmEDaw",
            authDomain: "uproot-dc685.firebaseapp.com",
            projectId: "uproot-dc685",
            storageBucket: "uproot-dc685.appspot.com",
            messagingSenderId: "274237654875",
            appId: "1:274237654875:web:992e1142aef7f40ac3fc7e",
            measurementId: "G-YF0JV8QR4Z"));
  } else {
    await Firebase.initializeApp();
  }
}
