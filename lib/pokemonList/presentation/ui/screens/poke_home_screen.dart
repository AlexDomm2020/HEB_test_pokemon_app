import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb_test_pokemon_app/apputils/poke_assets.dart';
import 'package:heb_test_pokemon_app/apputils/poke_constants.dart';
import 'package:heb_test_pokemon_app/apputils/poke_strings.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/pokemon_cubit.dart';
import 'package:heb_test_pokemon_app/pokemonList/presentation/ui/widgets/poke_main_card.dart';
import 'package:heb_test_pokemon_app/sharedui/poke_app_bar.dart';

class PokeHomeScreen extends StatefulWidget {
  const PokeHomeScreen({Key? key}) : super(key: key);

  @override
  State<PokeHomeScreen> createState() => _PokeHomeScreenState();
}

class _PokeHomeScreenState extends State<PokeHomeScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()..addListener(handleScrolling);
    context.read<PokemonCubit>().getPokemons('https://pokeapi.co/api/v2/pokemon?limit=10&offset=0');
    super.initState();
  }

  void handleScrolling(){
    if(scrollController.offset == scrollController.position.maxScrollExtent){
      final offset = context.read<PokemonCubit>().incrementOffset();
      context.read<PokemonCubit>().getPokemons('https://pokeapi.co/api/v2/pokemon?limit=10&offset=$offset');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokeAppBar(),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                  PokeConstants.getMediaQuery(context).width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: PokeConstants.getMediaQuery(context).width * 0.05,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        PokeAssets.pc,
                        height:
                        PokeConstants.getMediaQuery(context).width * 0.125,
                      ),
                      SizedBox(
                        width:
                        PokeConstants.getMediaQuery(context).width * 0.05,
                      ),
                      Expanded(
                        child: Text(
                          PokeStrings.instruccionesHomeScreen,
                          style: TextStyle(
                            fontSize:
                            PokeConstants.getMediaQuery(context).width *
                                0.035,
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
                        controller: scrollController,
                        separatorBuilder: (context, index) => SizedBox(
                          height:
                          PokeConstants.getMediaQuery(context).width * 0.05,
                        ),
                        itemCount: state.lastPokemonList.length,
                        itemBuilder: (context, index) => PokeMainCard(pokemon: state.lastPokemonList[index]),
                      ),
                    ),
                  ),
                  const LinearProgressIndicator()
                ],
              ),
            );
          }
          if (state is PokemonLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      PokeConstants.getMediaQuery(context).width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: PokeConstants.getMediaQuery(context).width * 0.05,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        PokeAssets.pc,
                        height:
                            PokeConstants.getMediaQuery(context).width * 0.125,
                      ),
                      SizedBox(
                        width:
                            PokeConstants.getMediaQuery(context).width * 0.05,
                      ),
                      Expanded(
                        child: Text(
                          PokeStrings.instruccionesHomeScreen,
                          style: TextStyle(
                            fontSize:
                                PokeConstants.getMediaQuery(context).width *
                                    0.035,
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
                        controller: scrollController,
                        separatorBuilder: (context, index) => SizedBox(
                          height:
                              PokeConstants.getMediaQuery(context).width * 0.05,
                        ),
                        itemCount: state.pokeList.length,
                        itemBuilder: (context, index) => PokeMainCard(pokemon: state.pokeList[index]),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
