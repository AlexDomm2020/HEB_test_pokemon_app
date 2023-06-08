import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/widgets/poke_team_card.dart';

import '../../../../apputils/poke_constants.dart';

class PokeTeam extends StatelessWidget {
  const PokeTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeCubit = context.read<PokemonCubit>();
    final pokeTeam = pokeCubit.getPokemonTeam();
    return AlertDialog(
      content: SizedBox(
        height: PokeConstants.getMediaQuery(context).height * 0.6,
        width: PokeConstants.getMediaQuery(context).width,
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonDeleted) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  state.pokeList.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => PokeTeamCard(
                                    pokeCubit: pokeCubit,
                                    pokemon: state.pokeList[index],
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: PokeConstants.getMediaQuery(context)
                                            .width *
                                        0.025,
                                  ),
                              itemCount: pokeTeam.length),
                        )
                      : Center(
                          child: Text(
                            PokeStrings.noHayPokemons,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    PokeConstants.getTextSizeSmall(context)),
                          ),
                        ),
                  SizedBox(
                    height: PokeConstants.getMediaQuery(context).width * 0.025,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            color: Colors.cyan,
                            height: PokeConstants.getMediaQuery(context).width *
                                0.07,
                            child: Center(
                              child: Text(
                                PokeStrings.cerrar,
                                style: TextStyle(
                                  fontSize:
                                      PokeConstants.getTextSizeMedium(context),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                pokeTeam.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => PokeTeamCard(
                                  pokemon: pokeTeam[index],
                                  pokeCubit: pokeCubit,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: PokeConstants.getMediaQuery(context)
                                          .width *
                                      0.025,
                                ),
                            itemCount: pokeTeam.length),
                      )
                    : Center(
                        child: Text(
                          PokeStrings.noHayPokemons,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  PokeConstants.getTextSizeMedium(context)),
                        ),
                      ),
                SizedBox(
                  height: PokeConstants.getMediaQuery(context).width * 0.025,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height:
                              PokeConstants.getMediaQuery(context).width * 0.07,
                          child: Center(
                            child: Text(
                              PokeStrings.cerrar,
                              style: TextStyle(
                                fontSize:
                                    PokeConstants.getTextSizeMedium(context),
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
