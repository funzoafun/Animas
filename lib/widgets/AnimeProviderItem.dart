import 'package:animas/model/AnimasModel.dart';
import 'package:animas/model/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeProviderItem extends StatelessWidget {
  const AnimeProviderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final animeProviderItem = Provider.of<AnimeProvider>(context);
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(120),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Image.asset(
            animeProviderItem.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
