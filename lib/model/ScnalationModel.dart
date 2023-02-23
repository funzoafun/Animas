import 'package:flutter/cupertino.dart';

class ScanlationModel with ChangeNotifier {
  String name;
  String image;
  String description;
  String bannerImage;

  ScanlationModel(this.name, this.image, this.description, this.bannerImage);
}
