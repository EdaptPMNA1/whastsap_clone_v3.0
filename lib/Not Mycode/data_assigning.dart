import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/inbox.dart';
import 'package:not_whatsapp/Not%20Mycode/participants_list.dart';
import 'package:not_whatsapp/main.dart';

class DataClass {
  final FirebaseDatabaseService jFirebaseDatabaseService =
      FirebaseDatabaseService();
  final addProfileInstance = AddProfile();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  late List<Map<String, dynamic>> firebaseData;
  final User? fireBaseUser = FirebaseAuth.instance.currentUser;
  User user = FirebaseAuth.instance.currentUser!;
  final inboxInstance = const Inbox();
  int jkIndex = 0;
  var fUid;
  var fParticipant;
  var fAppBarName;

  DatabaseReference getChatReference(String to) {
    return FirebaseDatabase.instance
        .ref()
        .child('chats')
        .child("From:${user.uid}")
        .child("To:$to");
  }

  void checkIfChildExists(String uid , String to, String time, String message) {
    // DatabaseReference childReference = getChatReference(to);
    DatabaseReference childRef = getChatReference(to);

    if (childRef == null) {
      print("Child does not exist: $to");
      jFirebaseDatabaseService.addChat(uid, to, time);
    } else {
      print("Child exists: $to");
      jFirebaseDatabaseService.updateChat(uid, to, time, message);
    }

    // Check if the child exists
    // childReference.once().then((DataSnapshot snapshot) {
    //   if (snapshot.value != null) {
    //     // Child exists
    //     print("Child exists: $to");
    //     jFirebaseDatabaseService.updateChat(uid, to, time, message);
    //   } else {
    //     // Child does not exist
    //     print("Child does not exist: $to");
    //     jFirebaseDatabaseService.addChat(uid, to, time);
    //   }
    // }).catchError((error) {
    //   // Handle errors during the database operation
    //   print("Error checking child existence: $error");
    // });
  }
}
