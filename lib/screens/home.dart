import 'dart:convert';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ProviderModel.dart';
import '../provider/AnimeProviders.dart';
import '../provider/api_provider.dart';
import '../model/AnimasModel.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static const routeName = '/home';
  List<Animes> allAnimes = [];

  final anime = ApiProvider().getSearchedAnimas().then((response) {
    final data = jsonDecode(response);
    // print(data['data']);
  });

  @override
  Widget build(BuildContext context) {
    final List<AnimeProvider> allProviders =
        Provider.of<AnimeProviders>(context, listen: false).allProviders;

    return Scaffold(
      appBar: AppBar(title: Text("All Your Mangas At One Place")),
      body: SafeArea(
        child: Center(
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 2,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 139, 109, 109),
                  ),
                  child: InkWell(
                    onTap: () {
                      print(allProviders);
                    },
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_UozQkECBmfVpiKlkykP33A3dHQC0_XVsWw&usqp=CAU'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
