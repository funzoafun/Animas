import 'package:animas/provider/Animes.dart';
import 'package:animas/provider/api_provider.dart';
import 'package:animas/widgets/AnimeItem.dart';
import 'package:animas/widgets/ScanlationItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/AnimasModel.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../provider/scanlations_provider.dart';

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
    final allanime = Provider.of<Animes>(context).allAnimes;
    final scanlationItem =
        Provider.of<ScanlationProvider>(context).scanlation(scanlationName);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 8, 8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Color.fromARGB(255, 7, 8, 8),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              Container(
                width: double.infinity,
                height: 180,
                child: ClipRRect(
                    child: Image.asset(
                  scanlationItem.bannerImage,
                  fit: BoxFit.fill,
                )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: ((context, index) =>
                        ChangeNotifierProvider.value(
                            value: allanime[index], child: AnimeItem())),
                    itemCount: allanime.length,
                  ),
                ),
              ),
            ]),
    );
  }
}
