import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// import 'mainui.dart';
import 'createnewaccount.dart';


// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   // await Firebase.initializeApp();
//   runApp(const createnewaccount());
// }

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );


void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: createnewaccount()));
}

var themeColorGreen = const Color.fromARGB(255, 9, 110, 81);





