import 'package:animas/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/Animes.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({super.key});
  static const routeName = "/chapter-name";

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  var _isInit = true;
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final chapterDetail = ModalRoute.of(context)!.settings.arguments as List;
      final provider = chapterDetail.first;
      final chapterId = chapterDetail.last;
      print(chapterId);
      Provider.of<Animes>(context).fetchAndSetChapters(provider, chapterId);
      setState(() {
        _isLoading = false;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Text(''),
    );
  }
}
