import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define the userList globally
List<FireBaseUserQ> userList = [];

// Map<int, FireBaseUserQ> myMap = {};
// Map<int, FireBaseUserQ> myMap = { for (var k in userList.asMap().keys) k : userList[k] };
Map<int, FireBaseUserQ> userDetails = Map.fromIterable(
  userList.asMap().keys,
  key: (k) => k,
  value: (k) => userList[k],
);

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  TextEditingController _userName = TextEditingController();
  TextEditingController _userBio = TextEditingController();

  void getAllUsersQ() async {
    QuerySnapshot querySnapshot = await users.get();
    querySnapshot.docs.forEach((doc) {
      FireBaseUserQ user = FireBaseUserQ(
          uid: doc['Uuid'],
          bio: doc['Bio'],
          name: doc['Name'],
          phoneNumber: doc['Phno'],
          avatar: '',
          messageFrom: 'Someone',
          lastMessage: '',
          isImage: false,
          sent: false,
          delivered: false,
          unread: 0,
          seen: true,
          date: DateTime.now().toString());

      // Check if the user already exists in the list based on the user id
      if (!userList.any((element) => element.uid == user.uid)) {
        setState(() {
          userList.add(user);
          print('\n\n\nDetails Saved\n\n\n');
        });
      }
    });
  }

  void addUserDetails(String userName, String userBio) {
    try {
      users.doc(firebaseUser!.uid).set({
        'Name': userName,
        'Bio': userBio,
        'Uuid': firebaseUser!.uid,
        'Phno': firebaseUser!.phoneNumber,
        // 'Image': Image.asset('images/chat-profile-1.jpeg')
      }).then((_) {
        print('User details added successfully');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainApp()));
        Navigator.pushNamed(context, RouteNames.settingsPage);
      }).catchError((error) {
        print('Failed to add user details: $error');
        // Handle the error accordingly
      });
    } on FirebaseException catch (e) {
      print('Firebase Exception: $e');
      // Handle the Firebase exceptions
    } catch (e) {
      print('Error: $e');
      // Handle other exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add Profile",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                ),
                Positioned(
                  right: -0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(150),
                      //more than 50% of width makes circle
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your Name',
              ),
            ),
            SizedBox(height: 23),
            TextField(
              controller: _userBio,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.info_outline),
                hintText: 'About',
              ),
            ),
            SizedBox(height: 23),
            Text(
              firebaseUser!.phoneNumber.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                String userName = _userName.text;
                String userBio = _userBio.text;
                try {
                  users.doc(firebaseUser!.uid).set({
                    'Name': userName,
                    'Bio': userBio,
                    'Uuid': firebaseUser!.uid,
                    'Phno': firebaseUser!.phoneNumber
                  });
                  Navigator.pushNamed(context, RouteNames.mainScreen);
                } on Exception catch (e) {
                  print('The Error is : $e');
                }
                getAllUsersQ();
                setLoggedInStatus(true);
                // users.count();
                // addUserDetails(userName, userBio);
              },
              child: Text(
                'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FireBaseUserQ {
  final String uid;
  final String bio;
  final String name;
  final String phoneNumber;
  // final AssetImage avatar;
  // final int id;
  final String avatar;
  // final String name;
  final String messageFrom;
  final String lastMessage;
  final bool isImage;
  final bool sent;
  final bool delivered;
  final int unread;
  final bool seen;
  final String date;

  FireBaseUserQ({
    required this.uid,
    required this.bio,
    required this.name,
    required this.phoneNumber,
    // required this.avatar
    // required this.id,
    required this.avatar,
    // required this.name,
    required this.messageFrom,
    required this.lastMessage,
    required this.isImage,
    required this.sent,
    required this.delivered,
    required this.unread,
    required this.seen,
    required this.date,
  });
}

void setLoggedInStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', value);
}
