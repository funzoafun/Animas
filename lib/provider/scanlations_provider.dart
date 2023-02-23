import 'package:flutter/cupertino.dart';

import '../model/ScnalationModel.dart';

class ScanlationProvider with ChangeNotifier {
  final List<ScanlationModel> _allProvider = [
    ScanlationModel(
      "asura",
      "assets/images/sites/asura.jpeg",
      "best place to enjoy reading manhwas",
    ),
    ScanlationModel(
      "alpha",
      "assets/images/sites/alpha.png",
      "best place to enjoy reading manhwas",
    ),
    ScanlationModel(
      "flame",
      "assets/images/sites/flame.jpeg",
      "best place to enjoy reading manhwas",
    ),
    ScanlationModel(
      "omega",
      "assets/images/sites/omega.png",
      "best place to enjoy reading manhwas",
    ),
    ScanlationModel(
      "luminous",
      "assets/images/sites/luminous.png",
      "best place to enjoy reading manhwas",
    ),
    ScanlationModel(
      "realm",
      "assets/images/sites/realm.png",
      "best place to enjoy reading manhwas",
    )
  ];

  List<ScanlationModel> get allProviders {
    return [..._allProvider];
  }
}
