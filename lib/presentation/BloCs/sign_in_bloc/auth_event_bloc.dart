import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {

   @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  String email;
  String password;
  SignInRequested({this.email, this.password});
}

class SignUpRequested extends AuthEvent {
  String email;
  String password;
  SignUpRequested({this.email,this.password});
}
class SignAuthRequested extends AuthEvent{

}
