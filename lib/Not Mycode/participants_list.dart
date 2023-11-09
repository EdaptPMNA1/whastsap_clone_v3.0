// // import 'package:flutter/material.dart';
// // import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
// // import 'package:not_whatsapp/Not%20Mycode/constants.dart';
// // // import 'package:not_whatsapp/Not%20Mycode/dummy_data.dart';
// // import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
// // import 'package:not_whatsapp/Not%20Mycode/utils.dart';

// // class ConversationList extends StatelessWidget {
// //   const ConversationList({
// //     super.key,
// //   });
// //   // void initState() {
// //   //   getAllUsers();
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         ArchiveTile(),
// //         Expanded(
// //           child: ListView.separated(
// //               padding: EdgeInsets.symmetric(
// //                   horizontal: Utils.kDefaultSpace / 2, vertical: 0),
// //               // itemCount: KDummyData.chatsList.length,
// //               itemCount: userList.length,
// //               separatorBuilder: (c, i) => Utils.verticalSpace(10),
// //               itemBuilder: ((context, index) {
// //                 final element = userList[index];
// //                 // final element = KDummyData.chatsList[index];
// //                 return ParticipateTile(player: element);
// //               })),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class ArchiveTile extends StatelessWidget {
// //   const ArchiveTile({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       contentPadding: EdgeInsets.symmetric(
// //         horizontal: Utils.kDefaultSpace,
// //         vertical: Utils.kDefaultSpace / 2,
// //       ),
// //       leading: Icon(
// //         Icons.archive_outlined,
// //         color: primaryColor,
// //       ),
// //       title: Text(
// //         "Archived",
// //         style: TextStyle(
// //           fontSize: 18,
// //           fontWeight: FontWeight.w600,
// //           color: textColor,
// //         ),
// //       ),
// //       trailing: Text(
// //         "5",
// //         style: TextStyle(
// //           fontSize: 16,
// //           fontWeight: FontWeight.w500,
// //           color: primaryColor,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
// import 'package:not_whatsapp/My%20Code/firebase_getter.dart';
// import 'package:not_whatsapp/Not%20Mycode/constants.dart';
// import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
// import 'package:not_whatsapp/Not%20Mycode/utils.dart';

// class ConversationList extends StatefulWidget {
//   const ConversationList({
//     Key? key,
//   });

//   @override
//   State<ConversationList> createState() => _ConversationListState();
// }

// class _ConversationListState extends State<ConversationList> {
//   late List<Map<String, dynamic>> firebaseData;

//   @override
//   void initState() {
//     super.initState();
//     retrieveDataFromFirebase();
//   }

//   void retrieveDataFromFirebase() async {
//     CollectionReference collection =
//         FirebaseFirestore.instance.collection('Users');
//     QuerySnapshot querySnapshot = await collection.get();

//     List<Map<String, dynamic>> data = [];
//     querySnapshot.docs.forEach((doc) {
//       data.add(doc.data() as Map<String, dynamic>);
//     });

//     setState(() {
//       firebaseData = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ArchiveTile(),
//         Expanded(
//           // child: FirebaseDataScreen(),
//           // firebaseData != null
//           // ? ListView.builder(
//           //     itemCount: firebaseData.length,
//           //     itemBuilder: (context, index) {
//           //       return ListTile(
//           //         title: Text(firebaseData[index]['Name']),
//           //         subtitle: Text(firebaseData[index]['Bio']),
//           //       );
//           //     },
//           //   )
//           // : const Center(
//           //     child: CircularProgressIndicator(),
//           //   ),
//           child: ListView.separated(
//             padding: EdgeInsets.symmetric(
//               horizontal: Utils.kDefaultSpace / 2,
//               vertical: 0,
//             ),
//             itemCount: firebaseData.length,
//             separatorBuilder: (c, i) => Utils.verticalSpace(10),
//             itemBuilder: (context, index) {
//               final element = userList[index];
//               // final element = firebaseData[index];
//               // return ListTile(
//               //     title: Text(firebaseData[index]['Name']),
//               //     subtitle: Text(firebaseData[index]['Bio']),
//               //   );
//               return ParticipateTile(player: element);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ArchiveTile extends StatelessWidget {
//   const ArchiveTile({
//     Key? key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: Utils.kDefaultSpace,
//         vertical: Utils.kDefaultSpace / 2,
//       ),
//       leading: Icon(
//         Icons.archive_outlined,
//         color: primaryColor,
//       ),
//       title: Text(
//         "Archived",
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: textColor,
//         ),
//       ),
//       trailing: Text(
//         "5",
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: primaryColor,
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';

class ConversationList extends StatefulWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  late List<Map<String, dynamic>> firebaseData;

  @override
  void initState() {
    super.initState();
    retrieveDataFromFirebase();
  }

  void retrieveDataFromFirebase() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Users');
    QuerySnapshot querySnapshot = await collection.get();

    List<Map<String, dynamic>> data = [];
    querySnapshot.docs.forEach((doc) {
      data.add(doc.data() as Map<String, dynamic>);
    });

    setState(() {
      firebaseData = data;
    });
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
            itemCount: firebaseData.length,
            separatorBuilder: (c, i) => Utils.verticalSpace(10),
            itemBuilder: (context, index) {
              // final element = firebaseData[index];
              final element = userList[index];
              return ParticipateTile(
                player: element,
                // name: element['Name'],
                // bio: element['Bio'],
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
