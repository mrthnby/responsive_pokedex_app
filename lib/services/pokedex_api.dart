import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/pokemon_model.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> list = [];

    var data = await Dio().get(_url);
    var jsonData = jsonDecode(data.data)["pokemon"];
    if (jsonData is List) {
      list = jsonData.map((e) => Pokemon.fromJson(e)).toList();
    }
  
    return list;
  }
}
