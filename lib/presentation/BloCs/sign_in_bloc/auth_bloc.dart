import 'package:e_comerce_app/data/repository/repository.dart';
import 'package:e_comerce_app/presentation/BloCs/sign_in_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_comerce_app/presentation/BloCs/sign_in_bloc/auth_event_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({this.authRepository})  :super(Unautentichated()){



    
  }
}
