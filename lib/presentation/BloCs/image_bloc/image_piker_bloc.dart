import 'package:bloc/bloc.dart';
import 'package:e_comerce_app/data/services/image_piker.dart';
import 'package:e_comerce_app/models/item_model.dart';
import 'package:equatable/equatable.dart';
part 'image_piker_event.dart';
part 'image_piker_state.dart';

class ImagePikerBloc extends Bloc<ImagePikerEvent, ImagePikerState> {
  ImagePiker imagePiker;
  Item item;
  ImagePikerBloc({this.imagePiker}) : super(ImagePikerInitial()) {
    on<PickImage>((event, emit) {
      try {
        emit(OnPiked());
      } catch (e) {
        emit(e);
      }
    });

    on<ImagePiked>((event, emit) {
      try {
        emit(OnImagePiked());
      } catch (e) {
        emit(e);
      }
    });
  }
}
