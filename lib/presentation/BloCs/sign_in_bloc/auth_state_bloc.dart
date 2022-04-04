import 'package:equatable/equatable.dart';


abstract class AuthState extends Equatable {

}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class Autentichated extends AuthState {
  @override
  List<Object> get props => [];
}

class UnAuthentichated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String error;
  AuthError({this.error});
  @override
  List<Object> get props => [error];
}
