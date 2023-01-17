import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String title = "Pokedex";

const TextStyle titlleTs = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 40,
);

const TextStyle pokemonTs = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 20,
);

const TextStyle pokemonDetailTs = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 30,
);

Size screenSize = const Size(1080, 2220);

double imageSize() {
  if (ScreenUtil().orientation == Orientation.portrait) {
    return 0.2.sw;
  } else {
    return 0.3.sh;
  }
}

final Map<String, Color> typeColor = {
  "Grass": Colors.green,
  "Fire": Colors.redAccent,
  "Water": Colors.blue,
  "Electric": Colors.yellow,
  "Rock": Colors.grey,
  "Ground": Colors.brown,
  "Bug": Colors.lightGreenAccent.shade700,
  "Psychic": Colors.indigo,
  "Fighting": Colors.orange,
  "Ghost": Colors.deepPurple,
  "Normal": Colors.black26,
  "Poison": Colors.deepPurpleAccent,
  "Dragon": Colors.teal
};

Color getCardColor(String type) {
  if (typeColor.containsKey(type)) {
    return typeColor[type]!;
  } else {
    return Colors.pink.shade300;
  }
}
