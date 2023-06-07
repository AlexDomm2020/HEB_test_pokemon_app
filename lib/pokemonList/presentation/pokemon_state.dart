part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoading extends PokemonState {
  PokemonLoading(this.lastPokemonList);

  List<Pokemon> lastPokemonList;

  @override
  List<Object?> get props => [lastPokemonList];
}

class PokemonLoaded extends PokemonState {
  PokemonLoaded(this.pokeList);

  List<Pokemon> pokeList;

  @override
  List<Object?> get props => [pokeList];
}

class PokemonError extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonIncremented extends PokemonState {
  PokemonIncremented(this.offset);

  int offset;

  @override
  List<Object?> get props => [offset];
}
