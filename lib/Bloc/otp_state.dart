part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

class RequestOtpState extends OtpState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class RecievedOtpstate extends OtpState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class VerifyOtpState extends OtpState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ReSendOtpState extends OtpState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

