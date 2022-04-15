import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, String> {
  ProfileBloc() : super(null) {
    on<ChangeBuyerRequested>((event, emit) => (state + "Buyer"));
    on<ChangeSellerRequested>(
        (event, emit) => emit(state + "Seller"));
    on<RegisterStatusRequested>(
        (event, emit) => emit(state + "SignUp"));

    on<SignInStatusRequested>(
        (event, emit) => emit(state + "SignIN"));
  }
}
