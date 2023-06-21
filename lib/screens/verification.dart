import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/profile.dart';
import 'package:liveasy/theme.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  static String verificationcode = '';
  static String verificationID = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('verification'),
      ),
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
            Text(" code sent to 342423434"),
            SizedBox(
              height: 20,
            ),
            Pinput(
              length: 6,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Didn\'t receive the code? Request Again"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  //     verificationId: VerificationScreen.verificationID,
                  //     smsCode: VerificationScreen.verificationcode);
                  // await FirebaseAuth.instance.signInWithCredential(credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ));
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
