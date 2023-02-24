import 'package:flutter/cupertino.dart';

class Animas with ChangeNotifier {
  String mangaid;
  String mangaTitle;
  String mangaCover;
  String mangaShortURl;
  String mangaUrl;
  String mangaSypnosis;
  String provider;
  String scrapeDate;
  // List<Chapter> chapters;

  Animas({
    required this.mangaid,
    required this.mangaTitle,
    required this.mangaCover,
    required this.mangaShortURl,
    required this.mangaUrl,
    required this.mangaSypnosis,
    required this.provider,
    required this.scrapeDate,
    // required this.chapters,
  });
}

class Chapter {
  String chapterId;
  // String chapterNextSlug;
  int chapterOrder;
  // String chapterPrevSlug;
  String chapterShortUrl;
  String chapterTitle;
  String chapterNumber;
  String chapterUrl;
  List<dynamic> chapterContent;
  String chapterDate;
  String chapterType;
  String scrapeDate;

  Chapter({
    required this.chapterId,
    // required this.chapterNextSlug,
    required this.chapterOrder,
    // required this.chapterPrevSlug,
    required this.chapterShortUrl,
    required this.chapterTitle,
    required this.chapterNumber,
    required this.chapterUrl,
    required this.chapterContent,
    required this.chapterDate,
    required this.chapterType,
    required this.scrapeDate,
  });
}
