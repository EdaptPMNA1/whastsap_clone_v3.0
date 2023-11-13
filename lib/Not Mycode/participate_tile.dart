import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
// import 'package:not_whatsapp/Not%20Mycode/chats_model.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'package:intl/intl.dart';
import 'package:not_whatsapp/main.dart';

class ParticipateTile extends StatefulWidget {
  const ParticipateTile(
      {
      // super.key,
      required this.player,
      required this.index});

  final FireBaseUserQ player;
  final int index;

  @override
  State<ParticipateTile> createState() => _ParticipateTileState();
}

class _ParticipateTileState extends State<ParticipateTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        // Replace these values with actual data
        String uid = userList[widget.index].uid;
        String participant = userList[widget.index].name;
        // String message = 'Hello, how are you?';
        print("Uid:$uid\nName:$participant");
        // Create a new chat and add it to the Realtime Database
        await dataClass.jFirebaseDatabaseService.addChat(uid, participant);
        print("Clicked ParticipateTile List Tile");
        dataClass.fParticipant = participant;
        // Navigator.pushNamed(context, RouteNames.inbox);
        // Navigator.pushNamed(
        //   context,
        //   RouteNames.inbox,
        //   arguments: context,
        // );
        print('${dataClass.jkIndex},${widget.index}');
        dataClass.jkIndex = widget.index;

        print('${dataClass.jkIndex},${widget.index}');
        print("152364");
        setState(() {
          print('${dataClass.jkIndex},${widget.index}');
          // for (var name in userList) {
          // uid = dataClass.fUid;
          // dataClass.fParticipant = participant;
          // for (var v = 0; v < userList.length; v++) {
          //   if (userList[v].name == participant) {
          //     dataClass.jkIndex = v;
          print(dataClass.jkIndex);
          print(dataClass.fParticipant);
          print('----------------');
          //     print("USERLIST : ${userList[v].name}");
          //   }
          //   // print("NAME: ${name.name}");
          //   // }
          // }
        });
        // Assuming player.uid is a unique identifier for each user
        String currentUserId = uid; // Replace with the actual current user's ID
        // String participantUserId =
        //     participant; // The ID of the participant in the chat

        // Navigate to the chat screen with the required data
        Navigator.pushNamed(
          context,
          RouteNames.inbox,
          arguments: {
            'currentUserId': currentUserId,
            'participantName': participant,
            // Add more data if needed
          },
        );
      },
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: primaryColor,
        // backgroundImage: AssetImage(player.avatar),
      ),
      title: Text(
        userList[widget.index].name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: hTextColor,
        ),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.player.messageFrom == "user") ...[
            widget.player.seen
                ? Icon(Icons.done_all_rounded, color: Colors.blue, size: 20.w)
                : widget.player.delivered
                    ? Icon(Icons.done_all_rounded, size: 20.w)
                    : Icon(Icons.check, size: 20.w),
            Utils.horizontalSpace(3),
          ],
          Expanded(
            child: Text(
              widget.player.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: subTitleTextColor,
              ),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat.jm().format(DateTime.parse(widget.player.date)),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color:
                  widget.player.unread != 0 ? primaryColor : subTitleTextColor,
            ),
          ),
          if (widget.player.unread != 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: Text(
                widget.player.unread.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ],
      ),
    );
  }
}
