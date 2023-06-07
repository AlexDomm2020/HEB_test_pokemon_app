import 'package:flutter/material.dart';
import 'package:heb_test_pokemon_app/apputils/poke_assets.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/widgets/poke_main_card.dart';
import 'package:heb_test_pokemon_app/sharedui/poke_app_bar.dart';

class PokeHomeScreen extends StatelessWidget {
  const PokeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PokeConstants.getMediaQuery(context).width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: PokeConstants.getMediaQuery(context).width * 0.05,
            ),
            Row(
              children: [
                Image.asset(
                  PokeAssets.pc,
                  height: PokeConstants.getMediaQuery(context).width * 0.125,
                ),
                SizedBox(
                  width: PokeConstants.getMediaQuery(context).width * 0.05,
                ),
                Expanded(
                  child: Text(
                    PokeStrings.instruccionesHomeScreen,
                    style: TextStyle(
                      fontSize:
                          PokeConstants.getMediaQuery(context).width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: PokeConstants.getMediaQuery(context).width * 0.05,
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: PokeConstants.getMediaQuery(context).width * 0.05,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) => PokeMainCard(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
