import 'package:flutter/material.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/screens/poke_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokeHomeScreen(),
    );
  }
}
