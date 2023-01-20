import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_auth/email_auth.dart';
import 'package:equatable/equatable.dart';
part 'otp_event.dart';
part 'otp_state.dart';
EmailAuth emailAuth=EmailAuth(sessionName: "Sample session");

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
    on<RequestOtpEvent>(
      (event, emit) async {
        emit(RequestOtpState());

try{
 await Future.delayed(Duration(seconds: 3));
  if(event is RequestOtpEvent && state is RequestOtpState){

    emailAuth.sendOtp(recipientMail:"pcmvrms@gmail.com");
    emit(RecievedOtpstate());
  }

}catch(x){}
        // TODO: implement event handler
      },
    );
    on<RecievedOtpEvent>(
      (event, emit) {
        emit(RecievedOtpstate());
        // TODO: implement event handler
      },
    );
    on<VerifyOtpEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
  }
}
