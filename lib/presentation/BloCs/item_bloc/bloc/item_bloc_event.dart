part of 'item_bloc.dart';

abstract class ItemBlocEvent extends Equatable {
  const ItemBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemRequested extends ItemBlocEvent {
  final Item item;
  AddItemRequested(this.item);
}

class EditItemRequested extends ItemBlocEvent {
  final Item item;
  EditItemRequested(this.item);
}

class DeleteItemRequested extends ItemBlocEvent {
  final Item item;
  DeleteItemRequested(this.item);
}
 class RetrieveItemRequested extends ItemBlocEvent{

   
 }