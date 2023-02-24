import 'dart:convert';

import '../model/AnimasModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final apiKey = 'd38e998f8amsh4f046b9eac5d954p1b6ee6jsn32043a13bed8';

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

  Future<List<Animas>> getAnimesByProvider(String provider) async {
    final Uri url = Uri.parse(
        "https://manga-scrapper.p.rapidapi.com/series/?provider=${provider}&limit=10");
    final headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'manga-scrapper.p.rapidapi.com'
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    final extractedData = await jsonDecode(response.body);
    final List<dynamic> animelist = extractedData['data']['series'];
    final List<Animas> allAnimes = [];
    animelist.forEach((element) {
      // List<Chapter> chapters = [];
      // getAnimeChapters(element["_type"], element["_id"])
      //     .then((value) => chapters = value);
      if (element["MangaCover"] != null &&
          element["MangaShortUrl"] != null &&
          element["MangaSynopsis"] != null &&
          element["_id"] != null &&
          element["MangaUrl"] != null &&
          element["_type"] != null &&
          element["ScrapeDate"] != null) {
        allAnimes.add(
          Animas(
            mangaid: element['_id'],
            mangaTitle: element['MangaTitle'],
            mangaCover: element["MangaCover"] ??
                "data:image/png;base64,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",
            mangaShortURl: element['MangaShortUrl'] ?? 'nourl',
            mangaUrl: element["MangaUrl"],
            mangaSypnosis: element['MangaSynopsis'] ?? 'no synopsis',
            provider: element["_type"],
            scrapeDate: element['ScrapeDate'],
            // chapters: chapters,
          ),
        );
      }
    });

    return allAnimes;
  }

  Future<List<Chapter>> getAnimeChapters(
      String provider, String chapterId) async {
    final Uri url = Uri.parse(
        "https://manga-scrapper.p.rapidapi.com/series/$chapterId/chapters/?provider=$provider");
    final headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'manga-scrapper.p.rapidapi.com'
    };

    final response = await http.get(url, headers: headers);
    final extractedData = await jsonDecode(response.body);
    final List<dynamic> chapterList = extractedData["data"]["series"];
    final List<Chapter> chapters = [];
    chapterList.forEach(
      (chapter) {
        if (chapter['_id'] != null &&
            chapter['ChapterNextSlug'] != null &&
            chapter['ChapterOrder'] != null &&
            chapter['ChapterPrevSlug'] != null &&
            chapter['ChapterShortUrl'] != null &&
            chapter['ChapterTitle'] != null &&
            chapter['ChapterNumber'] != null &&
            chapter['ChapterUrl'] != null &&
            chapter['ChapterContent'] != null &&
            chapter['ChapterCanonicalUrl'] != null &&
            chapter['ChapterDate'] != null &&
            chapter['ChapterType'] != null &&
            chapter['ScrapeDate'] != null) {
          chapters.add(
            Chapter(
              chapterId: chapter['_id'],
              // chapterNextSlug: chapter['ChapterNextSlug'],
              chapterOrder: chapter['ChapterOrder'],
              // chapterPrevSlug: chapter['ChapterPrevSlug'] ?? 'noslug',
              chapterShortUrl: chapter['ChapterShortUrl'],
              chapterTitle: chapter['ChapterTitle'],
              chapterNumber: chapter['ChapterNumber'],
              chapterUrl: chapter['ChapterUrl'],
              chapterContent: chapter['ChapterContent'],
              chapterDate: chapter['ChapterDate'],
              chapterType: chapter['ChapterType'],
              scrapeDate: chapter['ScrapeDate'],
            ),
          );
        }
      },
    );
    return chapters;
  }
}
