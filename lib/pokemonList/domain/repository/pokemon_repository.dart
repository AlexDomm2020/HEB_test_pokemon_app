abstract class PokemonRepository{
  Future<Map<String, dynamic>> getPokemons(String url);
}