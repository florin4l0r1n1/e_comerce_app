part of 'profile_bloc_bloc.dart';

abstract class ProfileBlocState extends Equatable {
  
}

class ProfileBlocSeller extends ProfileBlocState {
  final String status;

  ProfileBlocSeller(this.status);

  @override
  
  List<Object> get props => null;
}

class ProfileBlocBuyer extends ProfileBlocState {
  final String status;

  ProfileBlocBuyer(this.status);

  @override
  
  List<Object> get props => null;
}

class ProfileBlocIsRegisterd extends ProfileBlocState {
  final String status;

  ProfileBlocIsRegisterd(this.status);


  @override
  
  List<Object> get props => null;
}

class ProfileBlocIsNotRegisterd extends ProfileBlocState {
  final String status;

  ProfileBlocIsNotRegisterd(this.status);

  @override
  
  List<Object> get props => null;
}
