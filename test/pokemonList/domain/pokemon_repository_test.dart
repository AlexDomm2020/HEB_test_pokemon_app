import 'package:flutter_test/flutter_test.dart';
import 'package:heb_test_pokemon_app/pokemonList/domain/repository/pokemon_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pokemon_repository_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late MockPokemonRepository repository;

  setUpAll(() {
    repository = MockPokemonRepository();
  });

  test(
      'When we call get pokemons function, we will receive a future that will be the result/response containing our list of pokemons and the total item count.',
      () async {
    Map<String, dynamic> response = {};
    when(repository.getPokemons('https//:mockurl.com')).thenAnswer((_) async {
      return Future.value(response);
    });
    final result = await repository.getPokemons('https//:mockurl.com');
    expect(result, response);
  });
}
