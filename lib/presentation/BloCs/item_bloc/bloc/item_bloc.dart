import 'package:bloc/bloc.dart';
import 'package:e_comerce_app/data/repository/item_repository.dart';
import 'package:e_comerce_app/models/item_model.dart';
import 'package:equatable/equatable.dart';

part 'item_bloc_event.dart';
part 'item_bloc_state.dart';

class ItemBloc extends Bloc<ItemBlocEvent, ItemBlocState> {
  final ItemRepository itemRepository;

  ItemBloc({this.itemRepository}) : super(ItemBlocInitial()) {
    on<AddItemRequested>((event, emit) async {
      emit(ItemLoading());

      try {
        await itemRepository.addItem(event.item);
        emit(ItemAdded());
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });

    on<EditItemRequested>((event, emit) async {
      try {
        await itemRepository.updateIte(event.item);
        emit(ItemUpdated());
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });

    on<DeleteItemRequested>((event, emit) async {
      try {
        await itemRepository.deleteItem(event.item);
        emit(ItemDeleted());
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });
  }
}
