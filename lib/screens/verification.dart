// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:liveasy/screens/profile.dart';
import 'package:liveasy/theme.dart';

class VerificationScreen extends StatefulWidget {
  static String verificationcode = '';
  static String verificationID = '';
  final String phno;
  const VerificationScreen({
    Key? key,
    required this.phno,
  }) : super(key: key);


  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithPhoneNumber(BuildContext context) async {
    print(VerificationScreen.verificationID);
    print(VerificationScreen.verificationcode);
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationScreen.verificationID,
        smsCode: VerificationScreen.verificationcode,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      // Authentication is successful, handle authenticated user.
      // You can navigate to a new screen or perform any other action.
      print('Successfully signed in UID: ${userCredential.user!.uid}');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ));
    } catch (e) {
      // Handle sign-in failure, e.g., display an error message.
      print('Sign-in failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify Phone",
              style: Apptheme.boldtitle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(" code sent to ${widget.phno}"),
            SizedBox(
              height: 20,
            ),
            Pinput(
              onChanged: (value) {
                setState(() {
                  VerificationScreen.verificationcode = value;
                });
              },
              length: 6,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  _signInWithPhoneNumber(context);
                },
                child: Text("Didn\'t receive the code? Request Again")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  
                  _signInWithPhoneNumber(context);
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(280, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        Apptheme.continuesButtonColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: Text('Verify and Continue')),
          ],
        ),
      ),
    );
  }
}
