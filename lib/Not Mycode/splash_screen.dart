import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/Not%20Mycode/k_images.dart';
import 'package:not_whatsapp/main.dart';
import 'routes_name.dart';
import 'utils.dart';

//Splash Screen With Green Whatsapp Logo for 2 sec
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
        (value) => Navigator.popAndPushNamed(context, RouteNames.mainScreen));
    super.initState();
    getAllUsersQ();
    retrieveDataFromFirebase();
  }

  void retrieveDataFromFirebase() async {
    QuerySnapshot querySnapshot = await dataClass.users.get();

    List<Map<String, dynamic>> data = [];
    querySnapshot.docs.forEach((doc) {
      data.add(doc.data() as Map<String, dynamic>);
    });

    setState(() {
      dataClass.firebaseData = data;
    });
  }
  void getAllUsersQ() async {
    QuerySnapshot querySnapshot = await dataClass.users.get();
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Image.asset(KImages.logo),
              Spacer(),
              Text(
                'from',
                style: TextStyle(
                  color: Color(0xFF768289),
                  fontSize: 13,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Utils.verticalSpace(12),
              Text(
                'FACEBOOK',
                style: TextStyle(
                  color: Color(0xFF02B099),
                  fontSize: 12,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.40,
                ),
              ),
              Utils.verticalSpace(size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
