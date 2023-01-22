import 'dart:async';

import 'package:email_verification_using_otp/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward().whenComplete(() async{

         
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()))
        ;});
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: animation,
              child: const SizedBox(
                height: 200,
                width: 200,child: Hero(tag: "icon",
                child: Icon(Icons.email_rounded,size: 200,color: Colors.orange,))
               ,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
