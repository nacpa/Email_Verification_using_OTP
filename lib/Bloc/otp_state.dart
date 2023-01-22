part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
   OtpState();
}

class OtpInitial extends OtpState {
  OtpInitial():super();

  @override
  List<Object> get props => [];
}

class RequestOtpState extends OtpState{
  RequestOtpState();



  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class RecievedOtpstate extends OtpState{
  RecievedOtpstate();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class VerifiedOtpState extends OtpState{
  VerifiedOtpState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FailedOtpState extends OtpState{
  FailedOtpState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReSendOtpState extends OtpState{
  ReSendOtpState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class VerifingOtpState extends OtpState{
 VerifingOtpState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
