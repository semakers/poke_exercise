import 'package:exercise/model/pokemon_info.dart';
import 'package:exercise/pages/poke_details_page/poke_details_page.dart';
import 'package:exercise/pages/poke_list_page/poke_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'poke_list_page',
      routes: {
        'poke_list_page': (context) => const PokeListPage(),
        'poke_details_page': (context) {
          final pokemonInfo =
              ModalRoute.of(context)!.settings.arguments as PokemonInfo;
          return PokeDetailsPage(
            pokemonInfo: pokemonInfo,
          );
        }
      },
    );
  }
}
