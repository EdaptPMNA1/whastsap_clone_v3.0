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
    final user = KDummyData.participantQsChat;

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
                child: StreamBuilder(
                    stream: MessageController.streamData,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        final messageList = snapshot.data!.reversed.toList();
                        return GroupedListView<Messages, DateTime>(
                          padding: const EdgeInsets.all(0),
                          elements: messageList,
                          // controller: controller,
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
                          // optional
                          useStickyGroupSeparators: false,
                          // optional
                          floatingHeader: true,
                          // optional
                          order: GroupedListOrder.ASC, // optional
                        );
                      }
                      return const SizedBox();
                    }),
              ),
              TextEmojiInputField(),
              Utils.verticalSpace(size.height * 0.02),
            ],
          ),
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