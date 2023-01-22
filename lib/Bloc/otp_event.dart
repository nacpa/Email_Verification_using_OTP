part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class RequestOtpEvent extends OtpEvent{
  String Email;
  RequestOtpEvent({required this.Email});
  @override
  List<Object?> get props =>[];



}



class  RecievedOtpEvent extends OtpEvent{
  @override
 
  List<Object?> get props =>[];
}



class VerifyOtpEvent extends OtpEvent{
  int Otp;
  @override
 
  List<Object?> get props =>[];
  VerifyOtpEvent({required this.Otp});
}
