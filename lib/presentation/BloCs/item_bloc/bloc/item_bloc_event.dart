part of 'item_bloc.dart';

abstract class ItemBlocEvent extends Equatable {
  const ItemBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemRequested extends ItemBlocEvent {
final Item item;
 const AddItemRequested(this.item);
}

class EditItemRequested extends ItemBlocEvent {
  final Item item;
 const  EditItemRequested(this.item);
}

class DeleteItemRequested extends ItemBlocEvent {
  final Item item;
  const DeleteItemRequested(this.item);
}
 class RetrieveItemRequested extends ItemBlocEvent{

   
 }