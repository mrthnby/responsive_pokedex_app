import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

import '../models/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  late Future<List<Pokemon>> _pokeList;
  @override
  void initState() {
    super.initState();
    _pokeList = PokeApi.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _pokeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Pokemon> list = snapshot.data!;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Pokemon currentPokemon = list[index];
                  return PokemonCard(pokemon: currentPokemon);
                });
          } else if (snapshot.hasError) {
            return const Text(
              "Error",
              style: TextStyle(fontSize: 50),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
