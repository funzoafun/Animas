import 'package:flutter/cupertino.dart';

import '../model/ProviderModel.dart';

class AnimeProviders with ChangeNotifier {
  final List<AnimeProvider> _allProvider = [
    AnimeProvider(
      "asura",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "alpha",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "flame",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "omega",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "luminous",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    ),
    AnimeProvider(
      "realm",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU",
      "best place to enjoy reading manhwas",
    )
  ];

  List<AnimeProvider> get allProviders {
    return [..._allProvider];
  }
}
