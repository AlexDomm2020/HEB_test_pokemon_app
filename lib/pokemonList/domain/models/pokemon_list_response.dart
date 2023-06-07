import 'package:heb_test_pokemon_app/pokemonList/domain/models/pokemon_model.dart';

class PokemonListResponse {
  final List<Pokemon> pokemons;

  PokemonListResponse({required this.pokemons});

  factory PokemonListResponse.fromMap(Map map) {
    return PokemonListResponse(
        pokemons: List<Pokemon>.from(
            map['results'].map<Pokemon>((e) => Pokemon.fromJson(e))));
  }
}
