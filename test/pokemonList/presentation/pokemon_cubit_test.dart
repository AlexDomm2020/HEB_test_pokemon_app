import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heb_test_pokemon_app/pokemonList/data/pokemon_repository_impl.dart';
import 'package:heb_test_pokemon_app/pokemonList/domain/models/pokemon_model.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
        PokemonAdded(1),
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
              isAdded: false),
          Pokemon(
              name: 'pikachu',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: false),
          Pokemon(
              name: 'wartortle',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: false),
          Pokemon(
              name: 'blastoise',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: false),
          Pokemon(
              name: 'caterpie',
              url: '',
              sprites: Sprites(),
              types: [],
              isAdded: false),
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
              isAdded: false),
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
  });
}
