import 'package:flutter/material.dart';

class PokeColorGenerator {
  static Color getColorByType(String type) {
    if (type == PokemonTypes.normal.name) {
      return Colors.green[100]!;
    } else if (type == PokemonTypes.fire.name) {
      return Colors.orange;
    } else if (type == PokemonTypes.water.name) {
      return Colors.blue;
    } else if (type == PokemonTypes.grass.name) {
      return Colors.green;
    } else if (type == PokemonTypes.electric.name) {
      return Colors.yellow;
    } else if (type == PokemonTypes.ice.name) {
      return Colors.blue[200]!;
    } else if (type == PokemonTypes.fighting.name) {
      return Colors.red[700]!;
    } else if (type == PokemonTypes.poison.name) {
      return Colors.purple;
    } else if (type == PokemonTypes.ground.name) {
      return Colors.yellow[200]!;
    } else if (type == PokemonTypes.flying.name) {
      return Colors.purple[200]!;
    } else if (type == PokemonTypes.psychic.name) {
      return Colors.pinkAccent;
    } else if (type == PokemonTypes.bug.name) {
      return Colors.green[300]!;
    } else if (type == PokemonTypes.rock.name) {
      return Colors.grey;
    } else if (type == PokemonTypes.ghost.name) {
      return Colors.purple[700]!;
    } else if (type == PokemonTypes.dark.name) {
      return Colors.brown;
    } else if (type == PokemonTypes.dragon.name) {
      return Colors.purple[900]!;
    } else if (type == PokemonTypes.steel.name) {
      return Colors.grey[300]!;
    } else if (type == PokemonTypes.fairy.name) {
      return Colors.pink[100]!;
    } else {
      return Colors.transparent;
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
