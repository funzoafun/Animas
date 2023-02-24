import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/ScanlationItem.dart';
import '../provider/scanlations_provider.dart';
import '../provider/api_provider.dart';
import 'AnimeList.dart';

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
        Provider.of<ScanlationProvider>(context, listen: false).allProviders;

    return Scaffold(
      backgroundColor: Color.fromARGB(253, 44, 106, 165),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "All your scans at one place!",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 20, left: 100, right: 100),
                  child: ListView.builder(
                    itemBuilder: ((context, index) => InkWell(
                          onTap: (() => Navigator.of(context).pushNamed(
                              AnimeList.routeName,
                              arguments: allProviders[index].name)),
                          child: ChangeNotifierProvider.value(
                              value: allProviders[index],
                              child: ScanlationItem()),
                        )),
                    itemCount: allProviders.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
