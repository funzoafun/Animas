import 'dart:convert';

import '../model/AnimasModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future getSearchedAnimas() async {
    final Uri url = Uri.parse(
        'https://manga-scrapper.p.rapidapi.com/series/?provider=asura&limit=10');
    final headers = {
      'X-RapidAPI-Key': 'e78778340fmshc8dfaf9b064c385p10da98jsn4f7fd7116ce3',
      'X-RapidAPI-Host': 'manga-scrapper.p.rapidapi.com'
    };

    final response = await http.get(
      url,
      headers: headers,
    );
    final data = response.body;

    return data;
  }
}
