import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokeImg extends StatelessWidget {
  final Pokemon pokemon;
  const PokeImg({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/pokeball.jpg",
              height: imageSize(),
              width: imageSize(),
              fit: BoxFit.fitHeight,
            )),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img!,
              height: imageSize(),
              width: imageSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
