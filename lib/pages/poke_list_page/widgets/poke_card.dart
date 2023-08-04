import 'package:exercise/model/pokemon_info.dart';
import 'package:flutter/material.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({
    super.key,
    required this.pokemon,
  });

  final PokemonInfo pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            'poke_details_page',
            arguments: pokemon,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                pokemon.type1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
