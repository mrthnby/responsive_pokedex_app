import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/widgets/poke_info.dart';

import '../models/pokemon_model.dart';

class NameDetail extends StatelessWidget {
  final Pokemon pokemon;
  const NameDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.all(
              ScreenUtil().orientation == Orientation.portrait ? 8 : 0,
            ),
            splashRadius: 30,
            onPressed: () {
              Navigator.of(context).pop();
            },
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: ScreenUtil().orientation == Orientation.portrait
                  ? 0.08.sw
                  : 0.10.sh,
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon.name.toString(),
                  style: pokemonDetailTs,
                ),
                Text(
                  " #${pokemon.num.toString()}",
                  style: pokemonDetailTs,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Chip(label: Text(pokemon.type!.join(", "))),
          ),
        ],
      ),
    );
  }
}
