import 'package:flutter/cupertino.dart';

class AnimeProvider with ChangeNotifier {
  String name;
  String image;
  String description;

  AnimeProvider(this.name, this.image, this.description);
}
