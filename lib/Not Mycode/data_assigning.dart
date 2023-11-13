import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/inbox.dart';
import 'package:not_whatsapp/Not%20Mycode/participants_list.dart';

class DataClass {
  final addProfileInstance = AddProfile();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  late List<Map<String, dynamic>> firebaseData;
  final User? fireBaseUser = FirebaseAuth.instance.currentUser;
  User user = FirebaseAuth.instance.currentUser!;
  final FirebaseDatabaseService jFirebaseDatabaseService =
      FirebaseDatabaseService();
  final inboxInstance = Inbox();
  late int indexF;
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';

// class DataClass extends StatefulWidget {
//   DataClass({Key? key}) : super(key: key);

//   @override
//   _DataClassState createState() => _DataClassState();
// }

// class _DataClassState extends State<DataClass> {
//   final addProfileInstance = AddProfile();
//   final CollectionReference users =
//       FirebaseFirestore.instance.collection('Users');
//   late List<Map<String, dynamic>> firebaseData = [];



//   @override
//   void initState() {
//     super.initState();
//     // retrieveDataFromFirebase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // You can use firebaseData in your UI here
//     return Container();
//   }
// }
