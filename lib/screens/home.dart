import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/AnimeProviderItem.dart';
import '../provider/AnimeProviders.dart';
import '../provider/api_provider.dart';
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
      backgroundColor: Color.fromARGB(214, 28, 113, 192),
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
                              ScanlationsAnimes.routeName,
                              arguments: allProviders[index].name)),
                          child: ChangeNotifierProvider.value(
                              value: allProviders[index],
                              child: AnimeProviderItem()),
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
