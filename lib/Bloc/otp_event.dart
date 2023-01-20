part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class RequestOtpEvent extends OtpEvent{
  String Email;
  RequestOtpEvent({required this.Email});
  @override
  // TODO: implement props
  List<Object?> get props =>[];



}



class  RecievedOtpEvent extends OtpEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}



class VerifyOtpEvent extends OtpEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
