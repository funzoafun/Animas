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

  Animas({
    required this.mangaid,
    required this.mangaTitle,
    required this.mangaCover,
    required this.mangaShortURl,
    required this.mangaUrl,
    required this.mangaSypnosis,
    required this.provider,
    required this.scrapeDate,
  });
}
