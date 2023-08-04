part of '../poke_list_page.dart';

class PokeListLoaded extends StatelessWidget {
  const PokeListLoaded({
    super.key,
    required this.pokemonList,
  });

  final List<PokemonInfo> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<PokeListBloc>().add(
                LoadEvent(),
              );
        },
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: PokeCard(
                  pokemon: pokemon,
                ),
              );
            }),
      ),
    );
  }
}
