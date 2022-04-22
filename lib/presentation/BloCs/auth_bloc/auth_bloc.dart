import 'package:bloc/bloc.dart';
import 'package:e_comerce_app/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({this.authRepository}) : super(Unauthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(Loading());

      try {
        await authRepository.signIn(event.email, event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(Unauthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.registerUser(event.email, event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(Unauthenticated());
      }
    });
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(Unauthenticated());
    });
  }
}
