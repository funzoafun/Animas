import 'dart:convert';

import 'package:animas/model/AnimasModel.dart';
import 'package:animas/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<void> fetchAndSetChapters(String provider, String chapterId) async {
    try {
      final Uri url = Uri.parse(
          "https://manga-scrapper.p.rapidapi.com/series/$chapterId/chapters/?provider=$provider");
      final headers = {
        'X-RapidAPI-Key': 'd38e998f8amsh4f046b9eac5d954p1b6ee6jsn32043a13bed8',
        'X-RapidAPI-Host': 'manga-scrapper.p.rapidapi.com'
      };

      final response = await http.get(url, headers: headers);
      final extractedData = await jsonDecode(response.body);
      final List<dynamic> chapterList = extractedData["data"]["series"];
      final List<Chapter> chapters = [];
      chapterList.forEach((chapter) {
        // if (chapter['_id'] != null &&
        //     // chapter['ChapterNextSlug'] != null &&
        //     chapter['ChapterOrder'] != null &&
        //     // chapter['ChapterPrevSlug'] != null &&
        //     chapter['ChapterShortUrl'] != null &&
        //     chapter['ChapterTitle'] != null &&
        //     chapter['ChapterNumber'] != null &&
        //     chapter['ChapterUrl'] != null &&
        //     chapter['ChapterContent'] != null &&
        //     chapter['ChapterCanonicalUrl'] != null &&
        //     chapter['ChapterDate'] != null &&
        //     chapter['ChapterType'] != null &&
        //     chapter['ScrapeDate'] != null) {
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
            chapterType: chapter['_type'],
            scrapeDate: chapter['ScrapeDate'],
          ),
        );
      }
          // },
          );
      print(chapters);
    } catch (e) {
      print('error :: $e');
    }
  }
}
