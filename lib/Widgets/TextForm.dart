import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget EmailForm(TextEditingController _controller){
  return TextFormField(controller: _controller,


  decoration: InputDecoration(fillColor: Colors.grey.shade200,filled: true,
    focusedBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange),borderRadius: BorderRadius.circular(10)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    hintText: "Enter Email",
    hintStyle:  TextStyle(
        fontSize: 20,
        color:Colors.grey.shade600),
  ),validator:  (val) {
         if (!_controller.text.contains(".c") &&  !_controller.text.contains("@")   ) {
          return "Enter Valid  Email ";
        } else {
          return null;
        }
    },
  );
}

Widget OtpForm(TextEditingController _controller){


  return TextFormField(controller: _controller,
  decoration: InputDecoration(fillColor: Colors.grey.shade200,filled: true,
    focusedBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange),borderRadius: BorderRadius.circular(10)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    hintText: "Enter OTP",
    hintStyle:  TextStyle(
        fontSize: 20,
        color:Colors.grey.shade600),
  ),validator:  (val) {
        if (val!.isEmpty || val.length < 6) {
          return "Fill valid OTP";
        } else {
          return null;
        }





    },



  );
}