part of '../poke_list_page.dart';

class PokeListFail extends StatelessWidget {
  const PokeListFail({super.key});

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
                "Error en la carga de pokemons",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
