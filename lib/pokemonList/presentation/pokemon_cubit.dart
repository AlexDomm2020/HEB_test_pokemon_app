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
  int offset = 0;

  getPokemons(String url) async {
    emit(PokemonLoading(pokemonList));
    try {
      final response = await _pokeRepo.getPokemons(url);
      final count = response['count'];
      final pokeList = response['pokeList'];
      if(pokemonList.length <= count){
        pokemonList.addAll(pokeList);
      }
      emit(PokemonLoaded(pokemonList));
    } catch (e) {
      emit(PokemonError());
    }
  }

  int incrementOffset() {
    offset += 10;

    return offset;
  }
}
