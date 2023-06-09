import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/apputils/poke_color_generator.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';

import '../../../domain/models/pokemon_model.dart';

class PokeMainCard extends StatelessWidget {
  PokeMainCard({Key? key, this.pokemon, required this.isPokemonTeamFull})
      : super(key: key);

  Pokemon? pokemon;
  bool isPokemonTeamFull;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.grey[300],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: PokeConstants.getMediaQuery(context).width * 0.2,
                  width: PokeConstants.getMediaQuery(context).width * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.green.withOpacity(0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.network(pokemon!.sprites!.frontDefault!),
                ),
                SizedBox(
                    width: PokeConstants.getMediaQuery(context).width * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${PokeStrings.nombre} ${pokemon!.name![0].toUpperCase()}${pokemon!.name!.substring(1)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                PokeConstants.getTextSizeMediumLarge(context)),
                      ),
                      SizedBox(
                          height: PokeConstants.getMediaQuery(context).width *
                              0.01),
                      Text(
                        PokeStrings.tipo,
                        style: TextStyle(
                          fontSize: PokeConstants.getTextSizeSmall(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          height: PokeConstants.getMediaQuery(context).width *
                              0.03),
                      Wrap(
                        runSpacing:
                            PokeConstants.getMediaQuery(context).width * 0.02,
                        spacing:
                            PokeConstants.getMediaQuery(context).width * 0.02,
                        children: List.generate(
                          pokemon!.types!.length,
                          (index) => _skill(
                            context,
                            pokemon!.types![index].type!.name!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: PokeConstants.getMediaQuery(context).width * 0.025,
              right: PokeConstants.getMediaQuery(context).width * 0.025,
              bottom: PokeConstants.getMediaQuery(context).width * 0.025,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: !isPokemonTeamFull ? () {
                        context.read<PokemonCubit>().addPokemon(pokemon!);
                        context
                            .read<PokemonCubit>()
                            .updatePokemonList(pokemon!, true);
                      } : (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: !pokemon!.isAdded && !isPokemonTeamFull
                              ? Colors.red[700]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              PokeConstants.getMediaQuery(context).width *
                                  0.01),
                          child: Text(
                            !pokemon!.isAdded && !isPokemonTeamFull
                                ? PokeStrings.agregarEquipo
                                : !isPokemonTeamFull
                                    ? PokeStrings.yaEsParteDeTuEquipo
                                    : PokeStrings.equipoCompleto,
                            style: TextStyle(
                              color: !pokemon!.isAdded && !isPokemonTeamFull
                                  ? Colors.white
                                  : pokemon!.isAdded || isPokemonTeamFull
                                      ? Colors.red
                                      : Colors.red,
                              fontSize:
                                  PokeConstants.getTextSizeMedium(context),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _skill(BuildContext context, String typeName) {
    final colorList = PokeColorGenerator.getColorByType(typeName);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [colorList[0], colorList[1]],
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: PokeConstants.getMediaQuery(context).width * 0.02,
              right: PokeConstants.getMediaQuery(context).width * 0.02,
              top: PokeConstants.getMediaQuery(context).width * 0.01,
              bottom: PokeConstants.getMediaQuery(context).width * 0.01,
            ),
            child: Center(
              child: Text(
                typeName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: PokeConstants.getTextSizeSmall(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
