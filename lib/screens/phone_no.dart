// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:liveasy/screens/verification.dart';
import 'package:liveasy/theme.dart';

class PhoneScreen extends StatefulWidget {
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String? _selectedCountry = "+91";
  TextEditingController _controller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${_controller.text}",
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Verification is complete, handle authenticated user.
        // You can navigate to a new screen or perform any other action.
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure, e.g., display an error message.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          VerificationScreen.verificationID = verificationId;
        });
        print("pressed");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(phno: _controller.text),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          VerificationScreen.verificationID = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please enter your mobile number',
            style: Apptheme.boldtitle,
          ),
          SizedBox(
            height: 20,
          ),
          Text('You\'ll receive a 6 digit code \n             to verify next.'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.black),
              ),
              child: Row(
                children: [
                  DropdownButton<String?>(
                    dropdownColor: Colors.grey[200],
                    hint: Text("country"),
                    value: _selectedCountry,
                    onChanged: (String? newvalue) {
                      setState(() {
                        _selectedCountry = newvalue!;
                      });
                    },
                    items: <String>["+91", "+11", "+23", "+12"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ));
                    }).toList(),
                  ),
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none,
                      hintText: 'Mobile Number',
                    ),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                
                if (_controller.text.length != 10) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter a valid phone number"),
                    duration: Duration(seconds: 2),
                  ));
                  return;
                }
                // print(_selectedCountry! + _controller.text);

                _verifyPhoneNumber();
                
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(280, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(Apptheme.continuesButtonColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: Text('continue')),
          Spacer(),
          Stack(
            children: [
              curveImage(context, "assets/Vectorc6.png"),
              Positioned(
                  bottom: 0, child: curveImage(context, "assets/Vectorc5.png")),
            ],
          )
        ],
      ),
    );
  }
}
