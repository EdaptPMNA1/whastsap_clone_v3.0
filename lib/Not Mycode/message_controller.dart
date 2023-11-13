import 'dart:async';
// import 'package:not_whatsapp/Not%20Mycode/dummy_data.dart';
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
    // list = KDummyData.participantQsChat.messages;
    streamSink.add(list);
  }

  static addMessage(String message) {
    list.insert(
      0,
      Messages(
          uid: 10,
          message: message,
          sender: "user",
          date: DateTime.now(),
          seen: false,
          delivered: true,
          sent: true),
    );

    streamSink.add(list);
  }

  dispose() {
    streamController.close();
  }
}
