import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/name_detail.dart';

import '../constants.dart';
import '../widgets/poke_info.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getCardColor(pokemon.type![0].toString()),
      body: SafeArea(
        child: ScreenUtil().orientation == Orientation.portrait
            ? _portraitBuild()
            : _landscapeBuild(),
      ),
    );
  }

  Row _landscapeBuild() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NameDetail(pokemon: pokemon),
            Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.img!,
                height: 0.40.sh,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
        Expanded(child: PokeInfo(pokemon: pokemon))
      ],
    );
  }

  Column _portraitBuild() {
    return Column(children: [
      NameDetail(
        pokemon: pokemon,
      ),
      Expanded(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 20,
              child: Image.asset(
                "assets/pokeball.jpg",
                height: 0.3.sw,
                color: Colors.white.withOpacity(0.3),
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 0,
              top: 100,
              left: 0,
              right: 0,
              child: PokeInfo(pokemon: pokemon),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id!,
                child: CachedNetworkImage(
                  imageUrl: pokemon.img!,
                  height: 0.40.sw,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
