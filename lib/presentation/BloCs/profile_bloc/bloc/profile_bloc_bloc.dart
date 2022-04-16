import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeBuyerRequested>((event, emit) {
      emit(ProfileLoaded("Buyer"));
    });
    on<ChangeSellerRequested>((event, emit) {
      emit(ProfileLoaded("Seller"));
    });
    on<RegisterStatusRequested>((event, emit) {
      emit(ProfileLoaded("Register"));
    });
    on<SignInStatusRequested>((event, emit) {
      emit(ProfileLoaded("SignIn"));
    });
  }
}
