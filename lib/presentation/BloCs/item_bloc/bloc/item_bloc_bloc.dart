import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_bloc_event.dart';
part 'item_bloc_state.dart';

class ItemBlocBloc extends Bloc<ItemBlocEvent, ItemBlocState> {
  ItemBlocBloc() : super(ItemBlocInitial()) {
    on<ItemBlocEvent>((event, emit) {
      
    });
  }
}
