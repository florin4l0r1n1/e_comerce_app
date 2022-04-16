part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocEvent extends Equatable {
  const ProfileBlocEvent();
  @override
  List<Object> get props => [];
}

class ChangeBuyerRequested extends ProfileBlocEvent {
  final String text;

  const ChangeBuyerRequested(this.text);

  @override
  List<Object> get props => [];
}

class ChangeSellerRequested extends ProfileBlocEvent {
  final String text;

  const ChangeSellerRequested(this.text);
  @override
  List<Object> get props => [];
}

class RegisterStatusRequested extends ProfileBlocEvent {
  final String text;

 const RegisterStatusRequested(this.text);
 @override
  List<Object> get props => [];
}

class SignInStatusRequested extends ProfileBlocEvent {
  final String text;

  const SignInStatusRequested(this.text);
  @override
  List<Object> get props => [];
}
