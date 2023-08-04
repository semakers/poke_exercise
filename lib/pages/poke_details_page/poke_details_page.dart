import 'package:exercise/model/pokemon_info.dart';
import 'package:flutter/material.dart';

class PokeDetailsPage extends StatelessWidget {
  const PokeDetailsPage({
    super.key,
    required this.pokemonInfo,
  });

  final PokemonInfo pokemonInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonInfo.name,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(
                valueName: 'Id',
                value: pokemonInfo.id.toString(),
              ),
              if (pokemonInfo.pokemonId != null)
                _InfoRow(
                  valueName: 'Pkemon id',
                  value: pokemonInfo.pokemonId.toString(),
                ),
              if (pokemonInfo.form != null)
                _InfoRow(
                  valueName: 'Form',
                  value: pokemonInfo.form.toString(),
                ),
              _InfoRow(
                valueName: 'Type 1',
                value: pokemonInfo.type1.toString(),
              ),
              if (pokemonInfo.type2 != null)
                _InfoRow(
                  valueName: 'Type 2',
                  value: pokemonInfo.type2.toString(),
                ),
              _InfoRow(
                valueName: 'Generation',
                value: pokemonInfo.generation.toString(),
              ),
              _InfoRow(
                valueName: 'Atk',
                value: pokemonInfo.atk.toString(),
              ),
              _InfoRow(
                valueName: 'Sta',
                value: pokemonInfo.sta.toString(),
              ),
              _InfoRow(
                valueName: 'Def',
                value: pokemonInfo.def.toString(),
              ),
              _InfoRow(
                valueName: 'Max cp',
                value: pokemonInfo.maxcp.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    Key? key,
    required this.valueName,
    required this.value,
  }) : super(
          key: key,
        );

  final String valueName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$valueName :',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            value,
          )
        ],
      ),
    );
  }
}
