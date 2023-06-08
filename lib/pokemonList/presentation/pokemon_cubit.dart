import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heb_test_pokemon_app/pokemonList/data/pokemon_repository_impl.dart';
import 'package:meta/meta.dart';

import '../domain/models/pokemon_model.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._pokeRepo) : super(PokemonInitial());
  final PokemonRepositoryImplementation _pokeRepo;

  List<Pokemon> pokemonList = [];
  List<Pokemon> pokemonTeam = [];
  int offset = 0;

  Future getPokemons(String url) async {
    if (pokemonTeam.length < 5) {
      emit(PokemonLoading(pokemonList, false));
    } else {
      emit(PokemonLoading(pokemonList, true));
    }
    try {
      final response = await _pokeRepo.getPokemons(url);
      final count = response['count'];
      final pokeList = response['pokeList'];
      if (pokemonList.length <= count) {
        pokemonList.addAll(pokeList);
      }
      if (pokemonTeam.length < 5) {
        emit(PokemonLoaded(pokemonList, false));
      } else {
        emit(PokemonLoaded(pokemonList, true));
      }
    } catch (e) {
      emit(PokemonError());
    }
  }

  void addPokemon(Pokemon pokemon) {
    if (pokemonTeam.length < 5) {
      if (!pokemonTeam.contains(pokemon) && !pokemon.isAdded) {
        pokemonTeam.add(pokemon);
        emit(PokemonCount(pokemonTeam.length));
      } else {
        emit(PokemonError());
      }
    } else {
      emit(PokemonError());
    }
  }

  void deletePokemon(Pokemon pokemon) {
    pokemonTeam.removeWhere((element) => element.name == pokemon.name);
    emit(PokemonCount(pokemonTeam.length));
    if(pokemonTeam.isEmpty){
      emit(PokemonTeamEmpty());
    }
    if (pokemonTeam.length < 5) {
      emit(PokemonLoaded(pokemonList, false));
    } else {
      emit(PokemonLoaded(pokemonList, true));
    }
  }

  void updatePokemonList(Pokemon pokemon, bool isBeingAdded) {
    if (isBeingAdded) {
      final indexToRemove =
      pokemonList.indexWhere((element) => element.name == pokemon.name);
      pokemonList.removeAt(indexToRemove);
      pokemonList.insert(
        indexToRemove,
        Pokemon(
            name: pokemon.name,
            url: pokemon.url,
            sprites: pokemon.sprites,
            types: pokemon.types,
            isAdded: true),
      );
    } else {
      final indexToRemove =
      pokemonList.indexWhere((element) => element.name == pokemon.name);
      pokemonList.removeAt(indexToRemove);
      pokemonList.insert(
        indexToRemove,
        Pokemon(
            name: pokemon.name,
            url: pokemon.url,
            sprites: pokemon.sprites,
            types: pokemon.types,
            isAdded: false),
      );
    }
    if (pokemonTeam.length < 5) {
      emit(PokemonLoaded(pokemonList, false));
    } else {
      emit(PokemonLoaded(pokemonList, true));
    }
  }

  List<Pokemon> getPokemonTeam() {
    return pokemonTeam;
  }

  int incrementOffset() {
    offset += 10;

    return offset;
  }
}
