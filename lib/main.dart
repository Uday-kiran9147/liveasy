import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/firebase_options.dart';
import 'package:liveasy/screens/onboarding.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'liveasy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: OnboardingScreen(),
    );
  }
}
