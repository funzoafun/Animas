import 'dart:convert';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/AnimeItem.dart';
import '../provider/AnimeProviders.dart';
import '../provider/api_provider.dart';
import '../model/AnimasModel.dart';
import '../screens/ScanlationsAnimes.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static const routeName = '/home';

  final anime = ApiProvider().getSearchedAnimas().then((response) {
    final data = jsonDecode(response);
    // print(data['data']);
  });

  @override
  Widget build(BuildContext context) {
    final allProviders =
        Provider.of<AnimeProviders>(context, listen: false).allProviders;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "SCANLATIONS",
        textAlign: TextAlign.center,
      )),
      body: SafeArea(
        child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 2 / 3),
                itemCount: allProviders.length,
                itemBuilder: ((context, index) => InkWell(
                    onTap: (() => Navigator.of(context).pushNamed(
                        ScanlationsAnimes.routeName,
                        arguments: allProviders[index].name)),
                    child: ChangeNotifierProvider.value(
                      value: allProviders[index],
                      child: AnimeItem(),
                    ))))),
      ),
    );
  }
}
