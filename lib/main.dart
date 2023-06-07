import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/pokemonList/data/pokemon_repository_impl.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/screens/poke_home_screen.dart';
import 'package:heb_test_pokemon_app/providers/http_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PokemonCubit(PokemonRepositoryImplementation(HttpService())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokeHomeScreen(),
      ),
    );
  }
}
