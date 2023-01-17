import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final Pokemon pokemon;
  const PokeInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: ScreenUtil().orientation == Orientation.portrait
            ? const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pokemonDetail("Name", pokemon.name),
            _pokemonDetail("Height", pokemon.height),
            _pokemonDetail("Weight", pokemon.weight),
            _pokemonDetail("Spawn Time", pokemon.spawnTime),
            _pokemonDetail("Spawn Chance", pokemon.spawnChance),
            _pokemonDetail("Weakness", pokemon.weaknesses),
            _pokemonDetail("Pre Evolution", pokemon.prevEvolution),
            _pokemonDetail("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _pokemonDetail(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (value is List && value.isNotEmpty)
          Text(value.join(", "))
        else if (value == null)
          const Text(
            "Not Available",
            style: TextStyle(fontSize: 15),
          )
        else
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 15),
          )
      ],
    );
  }
}
