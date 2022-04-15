part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class ChangeBuyerRequested extends ProfileBlocEvent {}

class ChangeSellerRequested extends ProfileBlocEvent {}

class RegisterStatusRequested extends ProfileBlocEvent {}

class SignInStatusRequested extends ProfileBlocEvent {}
