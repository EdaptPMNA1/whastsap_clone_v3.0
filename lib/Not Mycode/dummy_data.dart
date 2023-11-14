import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/My%20Code/firebase_chat_model.dart';
import 'package:not_whatsapp/Not%20Mycode/call_log_model.dart';
import 'package:not_whatsapp/Not%20Mycode/channel_news_model.dart';
import 'package:not_whatsapp/Not%20Mycode/inbox.dart';
// import 'package:not_whatsapp/Not%20Mycode/chats_model.dart';
import 'package:not_whatsapp/Not%20Mycode/k_images.dart';
import 'package:not_whatsapp/Not%20Mycode/participants_chat_model.dart';
import 'package:not_whatsapp/main.dart';

// FirebaseFirestore firebaseStore = FirebaseFirestore.instance.collection("Users");
// final selectAUser = dataClass.inboxInstance;
const Inbox inb = Inbox();
CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
CollectionReference chatsCollection = FirebaseFirestore.instance.collection('Chats');


class KDummyData {
  static List<Map<String, String>> storyList = [
    {
      "user": "Martin Luther",
      "avatar": KImages.chatAvatar1,
    },
    {
      "user": "Carla Korsgaard",
      "avatar": KImages.chatAvatar3,
    },
    {
      "user": "Philip Westervelt",
      "avatar": KImages.chatAvatar6,
    }
  ];
  static ParticipantQsChat participantQsChat = ParticipantQsChat(
      uid: userList[dataClass.jkIndex].uid,
      participant: userList[dataClass.jkIndex].name,
      // avatar: KImages.chatAvatar1,
      status: "",
      contact: "",
      messages: <Messages>[
        Messages(
          uid: 1,
          message: "Hi",
          sender: "participantQ",
          reciever: "",
          date: DateTime.now(),
          seen: true,
          delivered: true,
          sent: true,
        ),
        // Messages(
        //   uid: 2,
        //   message: "Hello",
        //   sender: "user",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
        // Messages(
        //   uid: 3,
        //   message: "How are you?",
        //   sender: "user",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
        // Messages(
        //   uid: 4,
        //   message: "I'm absolutely fine, what about you?",
        //   sender: "participantQ",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
        // Messages(
        //   uid: 5,
        //   message: "Everything is going well",
        //   sender: "user",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
        // Messages(
        //   uid: 6,
        //   message: "Have you done your assignments?",
        //   sender: "participantQ",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
        // Messages(
        //   uid: 7,
        //   message: "No! not yet",
        //   sender: "user",
        //   date: DateTime.now(),
        //   seen: true,
        //   delivered: true,
        //   sent: true,
        // ),
      ],);

  static List<ChannelNews> channelNews = [
    ChannelNews(
      channelName: "The New York Times",
      avatar: KImages.newYorkTimes,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "Al Jazeera",
      avatar: KImages.alJazeera,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "Mark Zuckerberg",
      avatar: KImages.markZuck,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
    ChannelNews(
      channelName: "BBC News",
      avatar: KImages.bbc,
      news:
          "An Israeli airstrike hit a Gaza hospital on Tuesday, killing at least 200 Palestinians, according to the Palestinian Health Minister.",
      isImageAttached: true,
      newImage: "assets/images/morskie-oko-tatry.jpg",
      date: DateTime.now().toString(),
    ),
  ];

  static List<CallLog> callHistory = [
    CallLog(
      personName: "Martin Loe",
      avatar: KImages.chatAvatar1,
      time: "Today, 11:30 AM",
      callType: "Vuideo",
      isMissed: false,
      incoming: false,
      numberOfCall: 2,
    ),
    CallLog(
        personName: "Carla Korsgaard",
        avatar: KImages.chatAvatar1,
        time: "Yesterday, 8:47 PM",
        callType: "vuideo",
        isMissed: true,
        incoming: true,
        numberOfCall: 2),
    CallLog(
        personName: "John Doe",
        avatar: KImages.chatAvatar1,
        time: "Yesterday, 8:47 PM",
        callType: "audio",
        isMissed: false,
        incoming: true,
        numberOfCall: 2),
  ];

  static List<Map<String, String>> contacts = [
    {"user": "Martin Luther", "avatar": KImages.chatAvatar1, "status": "Busy"},
    {
      "user": "Bill Gates",
      "avatar": KImages.chatAvatar2,
      "status": "At school"
    },
    {
      "user": "Elon Mask",
      "avatar": KImages.chatAvatar3,
      "status": "Call me later"
    },
    {
      "user": "Tom Cruise",
      "avatar": KImages.chatAvatar4,
      "status": "I'm in a meeting"
    },
    {
      "user": "Barak Obama",
      "avatar": KImages.chatAvatar5,
      "status": "Available"
    },
    {"user": "Brandan M", "avatar": KImages.chatAvatar6, "status": "At gym"},
  ];
}
