import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCMzzOFQvtCw-1B3T1tVWhpHt4CzjiF0yI",
            authDomain: "airsoft-arena-ae65a.firebaseapp.com",
            projectId: "airsoft-arena-ae65a",
            storageBucket: "airsoft-arena-ae65a.firebasestorage.app",
            messagingSenderId: "521026531859",
            appId: "1:521026531859:web:606dc6379d08abc31e45e6"));
  } else {
    await Firebase.initializeApp();
  }
}
