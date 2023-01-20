import 'package:email_verification_using_otp/Widgets/TextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: SafeArea(
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

                    Visibility(visible: state is !RequestOtpState ,replacement: Center(child: CircularProgressIndicator(color: Colors.orange,),),child:CupertinoButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<OtpBloc>(context).add(RequestOtpEvent(Email: _emailController.text));
                          // Send OTP to email
                        }
                      },
                      child: const Text('Request OTP'),
                    ), ),
                    const SizedBox(height: 10),
                  if(state is RecievedOtpstate)  OtpForm(_otpController),
                    const SizedBox(height: 10),
                 if(state is RecievedOtpstate)   CupertinoButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Verify OTP
                        }
                      },
                      child: const Text('Verify OTP'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
