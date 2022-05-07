part of 'item_bloc.dart';

abstract class ItemBlocState extends Equatable {}

class ItemBlocInitial extends ItemBlocState {
  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemBlocState{
  @override
  List<Object> get props =>[];

  
}

class ItemAdded extends ItemBlocState {
  @override
  List<Object> get props => [];
}

class ItemDeleted extends ItemBlocState {
  @override
  List<Object> get props => [];
}

class ItemUpdated extends ItemBlocState {
  @override
  List<Object> get props => [];
}

class ItemError extends ItemBlocState {
  final String error;

  ItemError(this.error);

  @override
  List<Object> get props => [];
}
