part of 'image_piker_bloc.dart';

abstract class ImagePikerEvent extends Equatable {
  const ImagePikerEvent();

  @override
  List<Object> get props => [];
}

class PickImage extends ImagePikerEvent {
  Item item;
  PickImage({
    this.item,
  });
}

class ImagePiked extends ImagePikerEvent {
  Item item;
  ImagePiked({
    this.item,
  });
}

class RetrieveImage extends ImagePikerEvent {}
