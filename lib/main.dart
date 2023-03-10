import 'package:email_verification_using_otp/Screens/Splash.dart';
import 'package:flutter/material.dart';

import 'Screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otp Verification Using Email',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

