import 'dart:convert';

import 'package:heb_test_pokemon_app/pokemonList/domain/models/pokemon_list_response.dart';
import 'package:heb_test_pokemon_app/pokemonList/domain/models/pokemon_model.dart';
import 'package:heb_test_pokemon_app/pokemonList/domain/repository/pokemon_repository.dart';
import 'package:heb_test_pokemon_app/providers/http_service.dart';

class PokemonRepositoryImplementation implements PokemonRepository {
  PokemonRepositoryImplementation(this.httpService);

  HttpService httpService;

  @override
  Future<Map<String, dynamic>> getPokemons(String url) async {
    List<Pokemon> pokemonList = [];
    Map<String, dynamic> resultMap = {};
    try {
      final response = await httpService.get(url);
      final decodedJson = jsonDecode(response.body);
      final count = decodedJson['count'];
      final pokemonsResponse =
          PokemonListResponse.fromMap(decodedJson);
      for (var element in pokemonsResponse.pokemons) {
        final response = await httpService.get(element.url!);
        if (response.statusCode == 200) {
          final poke = Pokemon.fromJson(jsonDecode(response.body));
          pokemonList.add(poke);
        }
      }
      resultMap.addAll({'count' : count});
      resultMap.addAll({'pokeList' : pokemonList});
      return resultMap;
    } catch (e) {
      rethrow;
    }
  }
}
