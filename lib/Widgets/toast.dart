import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



void toast(String txt){
  Fluttertoast.showToast(
      msg: txt,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20
  );

}