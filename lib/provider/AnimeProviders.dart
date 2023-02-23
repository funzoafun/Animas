import 'package:flutter/cupertino.dart';

import '../model/ProviderModel.dart';

class AnimeProviders with ChangeNotifier {
  final List<AnimeProvider> _allProvider = [
    AnimeProvider(
      "asura",
      "assets/images/sites/asura.jpeg",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "alpha",
      "assets/images/sites/alpha.png",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "flame",
      "assets/images/sites/flame.jpeg",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "omega",
      "assets/images/sites/omega.png",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "luminous",
      "assets/images/sites/luminous.png",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "realm",
      "assets/images/sites/realm.png",
      "best place to enjoy reading manhwas",
    )
  ];

  List<AnimeProvider> get allProviders {
    return [..._allProvider];
  }
}
