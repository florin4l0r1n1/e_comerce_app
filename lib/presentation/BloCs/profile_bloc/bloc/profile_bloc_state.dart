part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocState extends Equatable {}

class ProfileInitial extends ProfileBlocState {
  @override
  
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileBlocState {
  final String status;

  ProfileLoaded(this.status);

  @override
 
  List<Object> get props => [status];
}
