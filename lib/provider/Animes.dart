import 'package:animas/model/AnimasModel.dart';
import 'package:animas/provider/api_provider.dart';
import 'package:flutter/material.dart';

class Animes with ChangeNotifier {
  List<Animas> _animes = [];

  List<Animas> get allAnimes {
    return [..._animes];
  }

  Future<void> fetchAndSetAnimes(String provider) async {
    try {
      final data = await ApiProvider().getAnimesByProvider(provider);
      _animes = data;
      notifyListeners();
    } catch (e) {
      print("error :: ${e}");
    }
  }
}
