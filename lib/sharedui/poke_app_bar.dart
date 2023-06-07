import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/apputils/poke_assets.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/widgets/poke_team.dart';

class PokeAppBar extends StatefulWidget implements PreferredSizeWidget {
  PokeAppBar({Key? key}) : super(key: key);

  @override
  State<PokeAppBar> createState() => _PokeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PokeAppBarState extends State<PokeAppBar> {
  int pokemonCount = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        PokeStrings.intercambioPokemon,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: PokeConstants.getTextSizeLarge(context),
        ),
      ),
      actions: [
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => PokeTeam(),
                  barrierDismissible: false
                );
              },
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: PokeConstants.getMediaQuery(context).height * 0.05,
                    width: PokeConstants.getMediaQuery(context).width * 0.13,
                    child: Image.asset(PokeAssets.pokeBall),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: PokeConstants.getMediaQuery(context).width * 0.08,
                    ),
                    child: BlocListener<PokemonCubit, PokemonState>(
                      listener: (context, state) {
                        if (state is PokemonAdded) {
                          pokemonCount = state.pokeCount;
                          setState(() {});
                        }
                      },
                      child: Text(
                        pokemonCount.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              PokeConstants.getTextSizeMediumLarge(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: PokeConstants.getMediaQuery(context).width * 0.025,
            ),
          ],
        ),
      ],
      centerTitle: false,
      backgroundColor: Colors.grey[300],
      elevation: 0,
    );
  }
}
