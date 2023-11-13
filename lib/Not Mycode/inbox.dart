import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:not_whatsapp/main.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);
  //   const Inbox({Key? key, required this.uid}) : super(key: key);

  // final String uid;

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  late ParticipantQsChat selectedUser = KDummyData.participantQsChat;
  // late ParticipantQsChat selectedUser;
  // late List<Map<String, dynamic>> selectedUser = dataClass.firebaseData[]['Name'];
  // String? selectedUserName = dataClass.firebaseData.isNotEmpty
  //   ? dataClass.firebaseData[0]['Name']
  //   : null;
// dynamic specificData = firebaseData.isNotEmpty ? firebaseData[0]['fieldName'] : null;

  void selectUser(ParticipantQsChat user) {
    setState(() {
      selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
<<<<<<< HEAD
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

=======
>>>>>>> 3ec096c251b4e3813ad01c419ae28218921cbb12

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
<<<<<<< HEAD
         appBar: _buildAppBar(user),
=======
        appBar: _buildAppBar(selectedUser),
>>>>>>> 3ec096c251b4e3813ad01c419ae28218921cbb12
        body: Container(
          height: size.height,
          width: size.width,
          decoration: _decoration(),
          child: Column(
            children: [
              Expanded(
<<<<<<< HEAD
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
=======
                child: StreamBuilder(
                    stream: MessageController.streamData,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        final messageList = snapshot.data!.reversed.toList();
                        return GroupedListView<Messages, DateTime>(
                          padding: const EdgeInsets.all(0),
                          elements: messageList,
                          groupBy: (element) => DateTime(
                            element.date.year,
                            element.date.month,
                            element.date.day,
                          ),
                          groupSeparatorBuilder: (DateTime groupByValue) =>
                              MessageSeparator(groupByValue: groupByValue),
                          itemBuilder: (context, Messages element) =>
                              MessageComponent(element: element),
                          itemComparator: (item1, item2) =>
                              item1.date.compareTo(item2.date),
                          useStickyGroupSeparators: false,
                          floatingHeader: true,
                          order: GroupedListOrder.ASC,
                        );
                      }
                      return const SizedBox();
                    }),
>>>>>>> 3ec096c251b4e3813ad01c419ae28218921cbb12
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
