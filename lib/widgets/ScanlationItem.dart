import 'package:animas/model/AnimasModel.dart';
import 'package:animas/model/ScnalationModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanlationItem extends StatelessWidget {
  const ScanlationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final animeProviderItem = Provider.of<ScanlationModel>(context);
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
