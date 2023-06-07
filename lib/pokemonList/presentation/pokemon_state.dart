part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoading extends PokemonState {
  PokemonLoading(this.lastPokemonList, this.isPokemonTeamFull);

  List<Pokemon> lastPokemonList;
  bool isPokemonTeamFull;


  @override
  List<Object?> get props => [lastPokemonList, isPokemonTeamFull];
}

class PokemonLoaded extends PokemonState {
  PokemonLoaded(this.pokeList, this.isPokemonTeamFull);

  List<Pokemon> pokeList;
  bool isPokemonTeamFull;

  @override
  List<Object?> get props => [pokeList, isPokemonTeamFull];
}

class PokemonError extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonAdded extends PokemonState {
  PokemonAdded(this.pokeCount);

  int pokeCount;

  @override
  // TODO: implement props
  List<Object?> get props => [pokeCount];
}

class PokemonDeleted extends PokemonState {
  PokemonDeleted(this.pokeList);

  List<Pokemon> pokeList;

  @override
  // TODO: implement props
  List<Object?> get props => [pokeList];
}
