import 'package:animas/provider/Animes.dart';
import 'package:animas/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/AnimasModel.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanlationsAnimes extends StatefulWidget {
  const ScanlationsAnimes({super.key});
  static const routeName = "/scanlationsAnime";

  @override
  State<ScanlationsAnimes> createState() => _ScanlationsAnimesState();
}

class _ScanlationsAnimesState extends State<ScanlationsAnimes> {
  var _isInit = true;
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final scanlationName =
          ModalRoute.of(context)!.settings.arguments as String;
      Provider.of<Animes>(context).fetchAndSetAnimes(scanlationName);
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final scanlationName = ModalRoute.of(context)!.settings.arguments as String;
    final animeItem = Provider.of<Animes>(context).allAnimes;

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.only(top: 150, right: 15, left: 15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(animeItem[index].mangaCover),
                        ),
                      ),
                      child: Text(animeItem[index].mangaTitle),
                    )),
                itemCount: animeItem.length,
              ),
            ),
    );
  }
}
