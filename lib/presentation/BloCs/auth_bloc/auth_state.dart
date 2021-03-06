part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  
}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object> get props => [];
}


class AuthError extends AuthState {
  final String error;

  AuthError({@required this.error});

  @override
  List<Object> get props => [];
}
