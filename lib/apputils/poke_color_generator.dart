import 'package:flutter/material.dart';

class PokeColorGenerator {
  static List<Color> getColorByType(String type) {
    if (type == PokemonTypes.normal.name) {
      return [Colors.green[100]!, Colors.green[200]!];
    } else if (type == PokemonTypes.fire.name) {
      return [Colors.orange, Colors.deepOrange];
    } else if (type == PokemonTypes.water.name) {
      return [Colors.blue, Colors.blue[900]!];
    } else if (type == PokemonTypes.grass.name) {
      return [Colors.green, Colors.green[700]!];
    } else if (type == PokemonTypes.electric.name) {
      return [Colors.yellow, Colors.yellow[200]!];
    } else if (type == PokemonTypes.ice.name) {
      return [Colors.blue[200]!, Colors.blue];
    } else if (type == PokemonTypes.fighting.name) {
      return [Colors.red[700]!, Colors.red[900]!];
    } else if (type == PokemonTypes.poison.name) {
      return [Colors.purple, Colors.deepPurple];
    } else if (type == PokemonTypes.ground.name) {
      return [Colors.yellow[200]!, Colors.grey[300]!];
    } else if (type == PokemonTypes.flying.name) {
      return [Colors.purple[200]!, Colors.purple[400]!];
    } else if (type == PokemonTypes.psychic.name) {
      return [Colors.pinkAccent, Colors.pink[200]!];
    } else if (type == PokemonTypes.bug.name) {
      return [Colors.green[300]!, Colors.greenAccent];
    } else if (type == PokemonTypes.rock.name) {
      return [Colors.grey, Colors.grey[300]!];
    } else if (type == PokemonTypes.ghost.name) {
      return [Colors.purple[700]!, Colors.purple];
    } else if (type == PokemonTypes.dark.name) {
      return [Colors.brown, Colors.grey[700]!];
    } else if (type == PokemonTypes.dragon.name) {
      return [Colors.purple[900]!, Colors.black];
    } else if (type == PokemonTypes.steel.name) {
      return [Colors.grey[300]!, Colors.blueGrey];
    } else if (type == PokemonTypes.fairy.name) {
      return [Colors.pink[100]!, Colors.white];
    } else {
      return [Colors.transparent, Colors.transparent];
    }
  }
}

enum PokemonTypes {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dark,
  dragon,
  steel,
  fairy,
}
