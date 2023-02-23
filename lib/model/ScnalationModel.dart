import 'package:flutter/cupertino.dart';

class ScanlationModel with ChangeNotifier {
  String name;
  String image;
  String description;

  ScanlationModel(this.name, this.image, this.description);
}
