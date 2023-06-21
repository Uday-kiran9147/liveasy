import 'package:flutter/material.dart';
import 'package:liveasy/screens/verification.dart';

class PhoneScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('phone number'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('PHONE NUMBER'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(),
                    ));
              },
              child: Text('Onboarding'))
        ],
      ),);
  }
}