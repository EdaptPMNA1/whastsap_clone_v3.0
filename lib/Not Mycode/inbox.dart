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
import 'package:not_whatsapp/main.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);
  //   const Inbox({Key? key, required this.uid}) : super(key: key);

  // final String uid;

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  late FirebaseChat selectedUser = KDummyData.participantQsChat;
  // late FirebaseChat selectedUser;
  // late ParticipantQsChat selectedUser;
  // late List<Map<String, dynamic>> selectedUser = dataClass.firebaseData[]['Name'];
  // String? selectedUserName = dataClass.firebaseData.isNotEmpty
  //   ? dataClass.firebaseData[0]['Name']
  //   : null;
// dynamic specificData = firebaseData.isNotEmpty ? firebaseData[0]['fieldName'] : null;

  // void selectUser(FirebaseChat user) {
  //   setState(() {
  //     selectedUser = user;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    for (var l = 0; l < userList.length; l++) {
      // for (var item in userList) {
      // print(l);
      // print(userList[l].uid);
      // print(userList[l].name);
      // print(dataClass.fParticipant);
      if (userList[l].name == dataClass.fParticipant) {
        dataClass.fAppBarName = userList[l];
        dataClass.jkIndex = l;
        print("\n");
        print(dataClass.fAppBarName.name);
        // selectedUser = dataClass.fAppBarName;
      }
      // print(selectedUser);
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: _buildAppBar(dataClass.fAppBarName),
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
              ),
              TextEmojiInputField(),
              Utils.verticalSpace(size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(FireBaseUserQ user) {
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
