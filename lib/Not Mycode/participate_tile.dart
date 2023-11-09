import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
// import 'package:not_whatsapp/Not%20Mycode/chats_model.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'package:intl/intl.dart';

class ParticipateTile extends StatelessWidget {
  const ParticipateTile({
    super.key,
    required this.player,
  });


  final FireBaseUserQ player;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.inbox);
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
        player.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: hTextColor,
        ),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (player.messageFrom == "user") ...[
            player.seen
                ? Icon(Icons.done_all_rounded, color: Colors.blue, size: 20.w)
                : player.delivered
                    ? Icon(Icons.done_all_rounded, size: 20.w)
                    : Icon(Icons.check, size: 20.w),
            Utils.horizontalSpace(3),
          ],
          Expanded(
            child: Text(
              player.lastMessage,
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
            DateFormat.jm().format(DateTime.parse(player.date)),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: player.unread != 0 ? primaryColor : subTitleTextColor,
            ),
          ),
          if (player.unread != 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: Text(
                player.unread.toString(),
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
