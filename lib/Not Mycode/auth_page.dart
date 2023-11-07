import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/custom_button.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:not_whatsapp/Not%20Mycode/size_extension.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'strings.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthPage extends StatefulWidget {
  // const AuthPage({super.key});
  const AuthPage({Key? key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool codeSented = false;
  String cCode = '+91';
  TextEditingController phNumber = TextEditingController();
  String fullNumber = '';
  String _verificationId = '';
  String otp = '';
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  Future<void> _requestSMSPermission() async {
    final status = await Permission.sms.request();
    if (status.isGranted) {
      print('SMS permission granted');
    } else if (status.isDenied) {
      print('SMS permission denied');
    } else if (status.isPermanentlyDenied) {
      print('SMS permission permanently denied');
    }
  }

  @override
  void initState() {
    super.initState();
    _requestSMSPermission();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> verifyPhoneNumber(String vFullNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: vFullNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
        print('Im Here');
        // Navigate to the next screen upon successful verification
        // Navigator.pushNamed(context, RouteNames.mainScreen);
      },
      verificationFailed: (FirebaseAuthException error) {
        // Handle the error
        print("Verification failed: ${error.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID for later use
        // This ID will be used in the code verification process
        setState(() {
          codeSented = true;
        });
        print("Verification ID: $verificationId");
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout
        print("Auto retrieval timeout: $verificationId");
      },
    );
  }

  void signInWithOTP(String smsCode, String verificationId) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Sign in with the credential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      setState(() {
        // Clear OTP after successful sign-in
        for (int i = 0; i < otpControllers.length; i++) {
          otpControllers[i].clear();
        }
        otp = '';
      });
      // Navigate to the next screen upon successful sign-in
      Navigator.pushNamed(context, RouteNames.addProfile);
      print("User signed in: ${userCredential.user?.uid}");
    } catch (e) {
      print("Failed to sign in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: scaffoldBgColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          KStrings.enterPhoneTitle,
          style: TextStyle(
            fontSize: 16.sp,
            color: primaryColor,
          ),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: subTitleTextColor),
              color: scaffoldBgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text("Link as companion device"),
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text.rich(
                  textAlign: TextAlign.center,
                  selectionColor: Colors.blue,
                  TextSpan(
                      text: KStrings.verifyAccountText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                          text: KStrings.myNumber,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ])),
              Utils.verticalSpace(10),
              Expanded(
                  child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image.asset(
                  'assets/pngwing.com.png',
                ),
              )),
              Center(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: Row(
                    children: [
                      /*1.*/ Expanded(
                          child: SizedBox(
                        width: size.width * 0.7,
                        child: DropdownButton<String>(
                            hint: Text("+91"),
                            isExpanded: true,
                            alignment: Alignment.center,
                            items: [
                              DropdownMenuItem(
                                child: Text("+91"),
                                value: "+91",
                                onTap: () {
                                  cCode = '+91';
                                },
                              ),
                              DropdownMenuItem(
                                child: Text("+971"),
                                value: "+971",
                                onTap: () {
                                  cCode = '+971';
                                },
                              ),
                              DropdownMenuItem(
                                child: Text("+966"),
                                value: "+966",
                                onTap: () {
                                  cCode = '+966';
                                },
                              ),
                              DropdownMenuItem(
                                child: Text("+974"),
                                value: "+974",
                                onTap: () {
                                  cCode = '+974';
                                },
                              ),
                            ],
                            onChanged: (v) {}),
                      )),
                      Utils.horizontalSpace(10),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: phNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: KStrings.phontHint,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              if (codeSented == true)
                Container(
                  color: Colors.transparent,
                  width: 400,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextField(
                              controller: otpControllers[index],
                              focusNode: focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index < 5) {
                                    focusNodes[index + 1].requestFocus();
                                  } else {
                                    focusNodes[index].unfocus();
                                  }
                                  otp = '';
                                  for (int i = 0; i < 6; i++) {
                                    otp += otpControllers[i].text;
                                  }
                                  if (otp.length == 6) {
                                    signInWithOTP(otp, _verificationId);
                                  }
                                } else {
                                  if (index > 0) {
                                    focusNodes[index - 1].requestFocus();
                                  }
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              Utils.verticalSpace(20),
              Text(
                KStrings.carrierCharge,
                style: TextStyle(
                  color: subTitleTextColor,
                ),
              ),
              Spacer(),
              SizedBox(
                  width: 100,
                  child: CustomButton(
                      text: "Next",
                      textSize: 16,
                      press: () {
                        if (phNumber.text.length == 10) {
                          fullNumber = cCode + phNumber.text;
                          print('Phone Number To Firebase : $fullNumber');
                          verifyPhoneNumber(fullNumber);
                        } else {
                          print('Please Enter A Valid Number');
                        }
                        // Navigator.pushNamed(context, RouteNames.mainScreen);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
