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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Number'),
      ),
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                // borderRadius: BorderRadius.circular(10)
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
                    items: <String>["+91", "+11", "+23", "12"]
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
                print(_controller.text);
                print(_selectedCountry);
                // await FirebaseAuth.instance.verifyPhoneNumber(
                //   phoneNumber: "${_selectedCountry}+${_controller.text}",
                //   verificationCompleted: (phoneAuthCredential) async {
                //     await FirebaseAuth.instance
                //         .signInWithCredential(phoneAuthCredential);
                //   },
                //   verificationFailed: (error) {
                //     if (error.code == 'invalid-phone-number') {
                //       print('The provided phone number is not valid.');
                //     }
                //   },
                //   codeSent: (verificationId, forceResendingToken) async {
                //     VerificationScreen.verificationID = verificationId;
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => VerificationScreen(),
                //         ));
                //     print(verificationId ?? "no id");
                //   },
                //   codeAutoRetrievalTimeout: (verificationId) {},
                // );
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationScreen(),
                        ));
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
