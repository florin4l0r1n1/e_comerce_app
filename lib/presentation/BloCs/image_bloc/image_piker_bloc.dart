import 'package:bloc/bloc.dart';
import 'package:e_comerce_app/data/services/image_piker.dart';
import 'package:e_comerce_app/models/item_model.dart';
import 'package:equatable/equatable.dart';

part 'image_piker_event.dart';
part 'image_piker_state.dart';

class ImagePikerBloc extends Bloc<ImagePikerEvent, ImagePikerState> {
   ImgPiker imgPiker;
  Item item;
  ImagePikerBloc(  {
    this.imgPiker,
  }) : super(ImagePikerInitial()) {
    on<PickImage>((event, emit) async {
      try {
        await imgPiker.getImage();
        emit(OnPiked());
      } catch (e) {
        emit(e);
      }
    });
  }
}
