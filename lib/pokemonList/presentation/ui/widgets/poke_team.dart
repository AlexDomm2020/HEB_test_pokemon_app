import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';

import '../../../../apputils/poke_constants.dart';

class PokeTeam extends StatelessWidget {
  const PokeTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeTeam = context.read<PokemonCubit>().getPokemonTeam();
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
                              itemBuilder: (context, index) => Container(
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Image.network(
                                              state.pokeList[index].sprites!
                                                  .frontDefault!,
                                              height:
                                                  PokeConstants.getMediaQuery(
                                                              context)
                                                          .width *
                                                      0.15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: PokeConstants.getMediaQuery(
                                                        context)
                                                    .width *
                                                0.015,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.pokeList[index].name!,
                                                  style: TextStyle(
                                                    fontSize: PokeConstants
                                                                .getMediaQuery(
                                                                    context)
                                                            .width *
                                                        0.035,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: PokeConstants
                                                              .getMediaQuery(
                                                                  context)
                                                          .width *
                                                      0.015,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<PokemonCubit>()
                                                        .deletePokemon(
                                                            pokeTeam[index]);
                                                  },
                                                  child: Container(
                                                    color: Colors.red[700],
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Text(
                                                          PokeStrings
                                                              .eliminarEquipo,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: PokeConstants
                                                                        .getMediaQuery(
                                                                            context)
                                                                    .width *
                                                                0.035,
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
                                    PokeConstants.getMediaQuery(context).width *
                                        0.03),
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
                                  fontSize: PokeConstants.getMediaQuery(context)
                                          .width *
                                      0.035,
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
                            itemBuilder: (context, index) => Container(
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Image.network(
                                            pokeTeam[index]
                                                .sprites!
                                                .frontDefault!,
                                            height: PokeConstants.getMediaQuery(
                                                        context)
                                                    .width *
                                                0.15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: PokeConstants.getMediaQuery(
                                                      context)
                                                  .width *
                                              0.015,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                pokeTeam[index].name!,
                                                style: TextStyle(
                                                  fontSize: PokeConstants
                                                              .getMediaQuery(
                                                                  context)
                                                          .width *
                                                      0.035,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    PokeConstants.getMediaQuery(
                                                                context)
                                                            .width *
                                                        0.015,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context
                                                      .read<PokemonCubit>()
                                                      .deletePokemon(
                                                          pokeTeam[index]);
                                                },
                                                child: Container(
                                                  color: Colors.red[700],
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        PokeStrings
                                                            .eliminarEquipo,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: PokeConstants
                                                                      .getMediaQuery(
                                                                          context)
                                                                  .width *
                                                              0.035,
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
                                  PokeConstants.getMediaQuery(context).width *
                                      0.03),
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
                          height:
                              PokeConstants.getMediaQuery(context).width * 0.07,
                          child: Center(
                            child: Text(
                              PokeStrings.cerrar,
                              style: TextStyle(
                                fontSize:
                                    PokeConstants.getMediaQuery(context).width *
                                        0.035,
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
