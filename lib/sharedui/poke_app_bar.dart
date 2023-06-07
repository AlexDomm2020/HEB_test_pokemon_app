import 'package:flutter/material.dart';
import 'package:heb_test_pokemon_app/apputils/poke_assets.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';

class PokeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        PokeStrings.intercambioPokemon,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Row(
          children: [
            Stack(
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
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          PokeConstants.getMediaQuery(context).width * 0.04,
                    ),
                  ),
                ),
              ],
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
