import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_verification_using_otp/Widgets/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
part 'otp_event.dart';
part 'otp_state.dart';
EmailAuth emailAuth=EmailAuth(sessionName: "Sample session");
int OTP=324211;

RxInt OtpAttempt=3.obs;

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
 await Future.delayed(Duration(seconds: 2));
  if(event is RequestOtpEvent && state is RequestOtpState){
    final random=Random();
    OTP=random.nextInt(999999);
    print(OTP);
    toast(OTP.toString());
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
      (event, emit) async {
        emit(VerifingOtpState());
       await Future.delayed(Duration(seconds: 1));
        if(event.Otp==OTP){
          OtpAttempt.value=3;
          emit(VerifiedOtpState());
        }else{
          OtpAttempt.value--;
          emit(FailedOtpState());
          if(OtpAttempt.value<=0) emit(ReSendOtpState());
        }

        // TODO: implement event handler
      },
    );
  }
}
