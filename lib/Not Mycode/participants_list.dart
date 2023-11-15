import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'package:not_whatsapp/main.dart';

class ConversationListTiles extends StatefulWidget {
  const ConversationListTiles({Key? key}) : super(key: key);

  @override
  State<ConversationListTiles> createState() => _ConversationListTilesState();
}


class _ConversationListTilesState extends State<ConversationListTiles> {
  // late List<Map<String, dynamic>> firebaseData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArchiveTile(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.kDefaultSpace / 2,
              vertical: 0,
            ),
            itemCount: dataClass.firebaseData.length,
            separatorBuilder: (c, i) => Utils.verticalSpace(10),
            itemBuilder: (context, index) {
              final element = userList[index];
              // setState(() {
              //   FIndex = index;
              // });
              // FIndex = index;
              return ParticipateTile(
                player: element,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ArchiveTile extends StatelessWidget {
  const ArchiveTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Utils.kDefaultSpace,
        vertical: Utils.kDefaultSpace / 2,
      ),
      leading: Icon(
        Icons.archive_outlined,
        color: primaryColor,
      ),
      title: Text(
        "Archived",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      trailing: Text(
        "5",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
    );
  }
}

class FirebaseDatabaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  // final DatabaseReference conversationRef =
  //     FirebaseDatabase.instance.ref().child('chats');
  final StreamController<List<String>> _conversationController =
      StreamController<List<String>>.broadcast();
  Stream<List<String>> get conversationStream => _conversationController.stream;

  Future<void> updateChat(
      String uid, String to, String time, String message) async {
    await _database.child('chats').child("From :${dataClass.user.uid}").child("To: ${dataClass.fUid}").child("Messages").set({
      'to': to,
      'message': message,
      'time': time,
      'timestamp': ServerValue.timestamp,
    });
  }
  
// Query rQuery = FirebaseDatabase.instance.ref()
//     .child('chats')
//     .child("From :${dataClass.user.uid}")
//     .child("To: ${dataClass.fUid}")
//     .child("Messages")
//     .orderByChild('timestamp');


  
  //   Future<void> addChat(
  //     String uid, String to, String time) async {
  //   await _database.child('chats').child("From :${dataClass.user.uid}").child("To: $uid").set({
  //     'to': to,
  //     'message': 'Created',
  //     'time': time,
  //     'timestamp': ServerValue.timestamp,
  //   });
  // }
  // Future<void> addMessage(
  //     String uid, String to, String time) async {
  //   await _database.child('chats').child("From :${dataClass.user.uid}").child("To: $uid").push().set({
  //     'to': to,
  //     'message':message,
  //     'time': time,
  //     'timestamp': ServerValue.timestamp,
  //   });
  // }
}
