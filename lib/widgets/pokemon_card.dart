import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import '../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        color: getCardColor(pokemon.type![0].toString()),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.toString(),
                style: pokemonTs,
              ),
              Chip(
                label: Text(
                  pokemon.type
                      .toString()
                      .substring(1, pokemon.type.toString().length - 1),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              PokeImg(
                pokemon: pokemon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
