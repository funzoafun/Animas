import 'package:flutter/cupertino.dart';

import '../model/ScnalationModel.dart';

class ScanlationProvider with ChangeNotifier {
  final List<ScanlationModel> _allProvider = [
    ScanlationModel(
      "asura",
      "assets/images/sites/asura.jpeg",
      "best place to enjoy reading manhwas",
      "assets/images/sites/asurabanner.jpeg",
    ),
    // ScanlationModel(
    //   "alpha",
    //   "assets/images/sites/alpha.png",
    //   "best place to enjoy reading manhwas",
    //   "assets/images/sites/asurabanner.jpeg",
    // ),
    ScanlationModel(
        "flame",
        "assets/images/sites/flame.jpeg",
        "best place to enjoy reading manhwas",
        'assets/images/sites/flamebanner.jpeg'),
    // ScanlationModel(
    //   "omega",
    //   "assets/images/sites/omega.png",
    //   "best place to enjoy reading manhwas",
    //   "assets/images/sites/asurabanner.jpeg",
    // ),
    ScanlationModel(
      "luminous",
      "assets/images/sites/luminous.png",
      "best place to enjoy reading manhwas",
      "assets/images/sites/luminous.jpeg",
    ),
    ScanlationModel(
      "realm",
      "assets/images/sites/realm.png",
      "best place to enjoy reading manhwas",
      "assets/images/sites/realmscans.webp",
    )
  ];

  List<ScanlationModel> get allProviders {
    return [..._allProvider];
  }

  ScanlationModel scanlation(String name) {
    return allProviders.firstWhere((element) => element.name == name);
  }
}
