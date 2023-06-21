import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future signup(String phno) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phno,
      verificationCompleted: (phoneAuthCredential) async {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (verificationId, forceResendingToken) async {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: "");
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        
      },
    );
  }
}
