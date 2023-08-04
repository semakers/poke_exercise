part of '../poke_list_page.dart';

class PokeListEmpty extends StatelessWidget {
  const PokeListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: () async {
          context.read<PokeListBloc>().add(
                LoadEvent(),
              );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Center(
              child: Text(
                "No hay pokemons",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
