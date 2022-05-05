part of 'item_bloc_bloc.dart';

abstract class ItemBlocState extends Equatable {
  const ItemBlocState();
  
  @override
  List<Object> get props => [];
}

class ItemBlocInitial extends ItemBlocState {}
