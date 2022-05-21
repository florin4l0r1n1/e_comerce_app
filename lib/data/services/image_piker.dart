import 'package:images_picker/images_picker.dart';

class ImgPiker {
  Future getImage() async {
    List<Media> res =
        await ImagesPicker.pick(count: 3, pickType: PickType.image);
    return res;
  }
}
