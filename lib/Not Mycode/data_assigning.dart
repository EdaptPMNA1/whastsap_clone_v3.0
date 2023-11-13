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
  final inboxInstance = const Inbox();
  int jkIndex = 0;
  var fUid;
  var fParticipant;
  var fAppBarName;
}