import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/dummy_data.dart';
import 'package:not_whatsapp/main.dart';
import 'participants_chat_model.dart';

class MessageController {
  // MessageController._();
  // static final MessageController _controller = MessageController._();
  // static get controller => _controller;

  static final streamController = StreamController<List<Messages>>.broadcast();

  static StreamSink<List<Messages>> get streamSink => streamController.sink;

  static Stream<List<Messages>> get streamData => streamController.stream;
  static List<Messages> list = [];
  static init() {
    list = KDummyData.participantQsChat.messages;
    streamSink.add(list);
  }

  static addMessage(String message) {
    list.insert(
      0,
      Messages(
        uid: 10,
        message: message,
        sender: dataClass.user.uid.toString(),
        reciever: userList[dataClass.jkIndex].uid.toString(),
        date: DateTime.now(),
        seen: true,
        delivered: true,
        sent: true,
      ),
    );

    streamSink.add(list);
    // fBs.addChat(chat)
  }

  dispose() {
    streamController.close();
  }
}

// FirebaseDatabaseService fBs = FirebaseDatabaseService();

class FirebaseDatabaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> addChat(FirebaseChat chat) async {
    await _database.child('chats').push().set(chat.toMap());
  }
}
