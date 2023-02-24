import 'package:animas/model/AnimasModel.dart';
import 'package:animas/model/ScnalationModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeItem extends StatefulWidget {
  const AnimeItem({super.key});

  @override
  State<AnimeItem> createState() => _AnimeItemState();
}

class _AnimeItemState extends State<AnimeItem> {
  bool showEditButton = false;
  @override
  Widget build(BuildContext context) {
    final animeItem = Provider.of<Animas>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            animeItem.mangaCover,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
