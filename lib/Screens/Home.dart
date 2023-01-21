import 'package:email_verification_using_otp/Widgets/TextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Bloc/otp_bloc.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc(),
      child: Scaffold(
        body: Stack(children: [Opacity(opacity: 0.1,
            child: Container(color: Colors.grey.shade100,height: MediaQuery.of(context).size.height,
              child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_13qczqum.json",fit: BoxFit.fill),)),SafeArea(
          child: BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 200, left: 50, right: 50),
                  children: <Widget>[
                    const Hero(
                        tag: "icon",
                        child: Icon(
                          Icons.email_outlined,
                          size: 150,
                          color: Colors.orange,
                        )),
                    EmailForm(_emailController),
                    const SizedBox(height: 10),

                    if(state is OtpInitial)CupertinoButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<OtpBloc>(context).add(RequestOtpEvent(Email: _emailController.text));
                          // Send OTP to email
                        }
                      },
                      child: const Text('Request OTP'),
                    ),
                    if(state is RequestOtpState) Center(child: CircularProgressIndicator(color: Colors.orange),),
                    const SizedBox(height: 10),
                    if(state is RecievedOtpstate || state is FailedOtpState||state is VerifingOtpState )  OtpForm(_otpController),
                    const SizedBox(height: 10),
                    if(state is RecievedOtpstate || state is FailedOtpState ||state is VerifingOtpState)   CupertinoButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          BlocProvider.of<OtpBloc>(context).add(VerifyOtpEvent(Otp: int.parse(_otpController.text)));
                          // Verify OTP
                        }
                      },
                      child:  Text(state is VerifingOtpState? 'Verifying.....':"Verify OTP"),
                    ),
                    if(state is FailedOtpState)  Obx(() => Center(child: Text("     Wrong OTP \nAttempts Left : ${OtpAttempt.value.toString()}",style: TextStyle(color: Colors.red,fontSize: 20),)),),
                    if(state is VerifiedOtpState)  Center(child: Text("Authentication Sucessfull",style: TextStyle(color: Colors.green),)),
                    if(state is ReSendOtpState) CupertinoButton(child: Text("Resend"), onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        _otpController.clear();
                        OtpAttempt.value=3;
                        BlocProvider.of<OtpBloc>(context).add(RequestOtpEvent(Email: _emailController.text));
                        // Send OTP to email
                      }
                    })

                  ],
                ),
              );
            },
          ),
        ),],)

      ),
    );
  }
}
