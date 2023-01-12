import 'package:flutter/material.dart';
import 'package:flutter_challenge/ui/Ep_5_tag_in_image/image_tag_model.dart';

class ImageTagProvider with ChangeNotifier {
  List<ImageTagModel> imagetags = [];

  void setImageTags(ImageTagModel value) {
    imagetags.add(value);

    notifyListeners();
  }

  void removeTag(int index) {
    imagetags.removeAt(index);
    notifyListeners();
  }
}
