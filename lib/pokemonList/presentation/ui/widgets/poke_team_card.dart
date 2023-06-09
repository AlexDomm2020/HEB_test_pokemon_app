import 'package:flutter/material.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';

import '../../../../apputils/poke_constants.dart';
import '../../../../apputils/poke_strings.dart';
import '../../../domain/models/pokemon_model.dart';

class PokeTeamCard extends StatelessWidget {
  PokeTeamCard({Key? key, this.pokemon, this.pokeCubit}) : super(key: key);
  Pokemon? pokemon;
  PokemonCubit? pokeCubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.green.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(5)),              child: Image.network(
                pokemon?.sprites?.frontDefault ?? '',
                height: PokeConstants.getMediaQuery(context).width * 0.15,
              ),
            ),
            SizedBox(
              width: PokeConstants.getMediaQuery(context).width * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pokemon?.name?[0].toUpperCase()}${pokemon?.name?.substring(1)}' ?? '',
                    style: TextStyle(
                      fontSize: PokeConstants.getTextSizeMedium(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: PokeConstants.getMediaQuery(context).width * 0.015,
                  ),
                  InkWell(
                    onTap: () {
                      pokeCubit?.deletePokemon(pokemon!);
                      pokeCubit?.updatePokemonList(pokemon!, false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red[700],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            PokeStrings.eliminarEquipo,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  PokeConstants.getTextSizeMedium(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
