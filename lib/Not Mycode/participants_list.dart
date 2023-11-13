import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
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
              // var indexF = index;
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    dataClass.indexF = index;
                  });
                  // Replace these values with actual data
                  String uid = userList[index].uid;
                  String participant = userList[index].name;
                  // String message = 'Hello, how are you?';
                  print("Uid:$uid\nName:$participant");
                  // Create a new chat and add it to the Realtime Database
                  await dataClass.jFirebaseDatabaseService
                      .addChat(uid, participant);

                  print('Lets Know Whats the element : $element');
                },
                child: ParticipateTile(
                  player: element,
                  index: index,
                ),
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

  Future<void> addChat(
      String uid, String participant /*, String message*/) async {
    await _database.child('chats').child(uid).push().set({
      'participant': participant,
      // 'message': message,
      'timestamp': ServerValue.timestamp,
    });
  }
}
