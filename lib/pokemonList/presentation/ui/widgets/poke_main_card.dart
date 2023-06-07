import 'package:flutter/material.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';

import '../../../domain/models/pokemon_model.dart';

class PokeMainCard extends StatelessWidget {
  PokeMainCard({Key? key, this.pokemon}) : super(key: key);

  Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                  color: Colors.white,
                  child: Image.network(pokemon!.sprites!.frontDefault!),
                ),
                SizedBox(
                    width: PokeConstants.getMediaQuery(context).width * 0.01),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${PokeStrings.nombre} ${pokemon!.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                PokeConstants.getMediaQuery(context).width *
                                    0.04),
                      ),
                      SizedBox(
                          height: PokeConstants.getMediaQuery(context).width *
                              0.01),
                      Text(
                        PokeStrings.tipo,
                        style: TextStyle(
                          fontSize:
                              PokeConstants.getMediaQuery(context).width * 0.03,
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
                  child: Container(
                    color: Colors.red[700],
                    child: Padding(
                      padding: EdgeInsets.all(
                          PokeConstants.getMediaQuery(context).width * 0.01),
                      child: Text(
                        PokeStrings.agregarEquipo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: PokeConstants.getMediaQuery(context).width *
                              0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _skill(BuildContext context, String typeName) {
    return Container(
      color: Colors.purple,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: PokeConstants.getMediaQuery(context).width * 0.02,
          ),
          Text(
            typeName,
            style: TextStyle(
                color: Colors.white,
                fontSize: PokeConstants.getMediaQuery(context).width * 0.03),
          ),
          SizedBox(
            width: PokeConstants.getMediaQuery(context).width * 0.02,
          ),
        ],
      ),
    );
  }
}
