import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/appbar_component.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/dummy_data.dart';
import 'package:not_whatsapp/Not%20Mycode/inbox_popup.dart';
import 'package:not_whatsapp/Not%20Mycode/input_text_emoji.dart';
import 'package:not_whatsapp/Not%20Mycode/k_images.dart';
import 'package:not_whatsapp/Not%20Mycode/message_controller.dart';
import 'package:not_whatsapp/Not%20Mycode/message_item.dart';
import 'package:not_whatsapp/Not%20Mycode/participants_chat_model.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'package:grouped_list/grouped_list.dart';
class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final user = KDummyData.participantQsChat;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    Future<void> sendMessage(String text) async {
  // final user = KDummyData.participantQsChat; // Get the current user
  final messagesCollection = firestore.collection('yourCollectionName');
  
  await messagesCollection.add({
    'text': text,
    'sende(rId': user.uid,
    'timestamp': FieldValue.serverTimestamp(),
  });
}


    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
         appBar: _buildAppBar(user),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: _decoration(),
          child: Column(
            children: [
              Expanded(
             child: StreamBuilder<QuerySnapshot>(
    stream: firestore.collection('yourCollectionName').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      final messageList = snapshot.data?.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        // Create a Messages object or your message model from the data.
        // Example:
        return Messages(
          uid: int,
          text: data['text'],
          senderId: data['senderId'],
          date: data['timestamp'].toDate(),     
          // Add other fields as needed.
        );
      }).toList();

      return GroupedListView<Messages, DateTime>(
        elements: MessageController.list, // Provide your messageList here
        groupBy: (Messages element) {
          // Group by the date property of your Messages class
          return DateTime(
            element.date.year,
            element.date.month,
            element.date.day,
          );
        },
        // ... other properties like itemBuilder, etc.
      );
    },
             ),
),
            ]
              ),
              
              // const TextEmojiInputField(),
              // Utils.verticalSpace(size.height * 0.02),
          
            
          ),
        ),
      );
    
  }

  AppBar _buildAppBar(ParticipantQsChat user) {
    return AppBar(
      backgroundColor: primaryColor,
      leadingWidth: 70.w,
      leading: AvatarAndBackNavigate(user: user),
      title: UserAndStatus(user: user),
      actions: [
        SvgPicture.asset(
          KImages.video,
          height: 24.w,
        ),
        Utils.horizontalSpace(24),
        SvgPicture.asset(
          KImages.phone,
          height: 24.w,
        ),
        Utils.horizontalSpace(10),
        InboxPopup()
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(KImages.defaultWallpaper), fit: BoxFit.cover),
    );
  }
}


// Future<void> _sentMessage() async {
//   QuerySnapshot querySnapshot = await users.get();
//     querySnapshot.docs.forEach((doc) {
//       ParticipantQsChat user = ParticipantQsChat(
//           uid: doc['Uuid'],
//           bio: doc['Bio'],
//           name: doc['Name'],
//           phoneNumber: doc['Phno'],
//           avatar: '',
//           messages:,
//           messageFrom: 'Someone',
//           lastMessage: '',
//           isImage: false,
//           sent: false,
//           delivered: false,
//           unread: 0,
//           seen: true,
//           date: DateTime.now().toString());

//       // Check if the user already exists in the list based on the user id
//       if (!userList.any((element) => element.uid == user.uid)) {
//         setState(() {
//           userList.add(user);
//           print('\n\n\nDetails Saved\n\n\n');
//         });
//       }
//     });
// }