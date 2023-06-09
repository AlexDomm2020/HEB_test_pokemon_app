import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heb_test_pokemon_app/pokemonList/data/pokemon_repository_impl.dart';
import 'package:heb_test_pokemon_app/pokemonList/domain/models/pokemon_model.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:mockito/annotations.dart';

import 'pokemon_cubit_test.mocks.dart';

@GenerateMocks([PokemonRepositoryImplementation])
void main() {
  late MockPokemonRepositoryImplementation mockRepo;
  late PokemonCubit pokemonCubit;

  setUp(() {
    mockRepo = MockPokemonRepositoryImplementation();
    pokemonCubit = PokemonCubit(mockRepo);
  });

  group('Add pokemon tests', () {

    blocTest<PokemonCubit, PokemonState>(
      'Emits [PokemonAdded] when addPokemon() is called successfully.',
      build: () => pokemonCubit,
      act: (cubit) => cubit.addPokemon(
        Pokemon(
            name: 'charizard',
            url: '',
            sprites: Sprites(),
            types: [],
            isAdded: false),
      ),
      expect: () => <PokemonState>[
        PokemonCount(1),
      ],
    );

    blocTest<PokemonCubit, PokemonState>(
      'When addPokemon() is called and pokemon list is full then emit [PokemonError].',
      build: () => pokemonCubit,
      setUp: () {
        pokemonCubit.pokemonTeam = [
          Pokemon(
              name: 'charizard',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
          Pokemon(
              name: 'pikachu',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
          Pokemon(
              name: 'wartortle',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
          Pokemon(
              name: 'blastoise',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
          Pokemon(
              name: 'caterpie',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
        ];
      },
      act: (cubit) => cubit.addPokemon(
        Pokemon(
            name: 'rayquaza',
            url: '',
            sprites: Sprites(),
            types: [],
            isAdded: false),
      ),
      expect: () => <PokemonState>[
        PokemonError(),
      ],
    );

    blocTest<PokemonCubit, PokemonState>(
      'When addPokemon() is called and pokemon is already in list emit [PokemonError] to notify it is already in list.',
      build: () => pokemonCubit,
      setUp: () {
        pokemonCubit.pokemonTeam = [
          Pokemon(
              name: 'charizard',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
        ];
      },
      act: (cubit) => cubit.addPokemon(
        Pokemon(
            name: 'charizard',
            url: '',
            sprites: Sprites(),
            types: [],
            isAdded: true),
      ),
      expect: () => <PokemonState>[
        PokemonError(),
      ],
    );

    blocTest<PokemonCubit, PokemonState>(
      'When deletePokemon() is called then emits [PokemonAdded, PokemonLoaded] states, first PokemonAdded to notify the count of'
      'pokemons we have in the list, then emit PokemonLoaded to change the api list status of pokemons',
      build: () => pokemonCubit,
      setUp: () {
        pokemonCubit.pokemonTeam = [
          Pokemon(
              name: 'charizard',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
          Pokemon(
              name: 'pikachu',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
        ];
      },
      act: (cubit) => cubit.deletePokemon(
        Pokemon(
            name: 'pikachu',
            url: '',
            sprites: Sprites(),
            types: [],
            isAdded: true),
      ),
      expect: () => <PokemonState>[
        PokemonCount(1),
        PokemonLoaded(pokemonCubit.pokemonList, false),
      ],
    );

    blocTest<PokemonCubit, PokemonState>(
      'When deletePokemon() is called and pokemon team is empty emits [PokemonTeamEmpty, PokemonCount, PokemonLoaded]'
      'we call PokemonTeamEmpty to provide info that team is empty, then count for the counter and loaded to update the api list.',
      build: () => pokemonCubit,
      setUp: () {
        pokemonCubit.pokemonTeam = [
          Pokemon(
              name: 'pikachu',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: true),
        ];
      },
      act: (cubit) => cubit.deletePokemon(
        Pokemon(
            name: 'pikachu',
            url: '',
            sprites: Sprites(),
            types: [],
            isAdded: true),
      ),
      expect: () => <PokemonState>[
        PokemonCount(0),
        PokemonTeamEmpty(),
        PokemonLoaded(pokemonCubit.pokemonList, false),
      ],
    );

  });
}
