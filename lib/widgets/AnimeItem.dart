import 'package:animas/model/AnimasModel.dart';
import 'package:animas/model/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    final animeItem = Provider.of<AnimeProvider>(context);
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage(animeItem.image)),
            shape: BoxShape.circle),
        child: Text(
          animeItem.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
