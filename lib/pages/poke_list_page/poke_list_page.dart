import 'package:exercise/model/pokemon_info.dart';
import 'package:exercise/pages/poke_list_page/bloc/poke_list_bloc.dart';
import 'package:exercise/pages/poke_list_page/widgets/poke_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sections/poke_list_empty.dart';
part 'sections/poke_list_loaded.dart';
part 'sections/poke_list_loading.dart';
part 'sections/poke_list_fail.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokeListBloc>(
      create: (_) => PokeListBloc()
        ..add(
          LoadEvent(),
        ),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeListBloc, PokeListState>(builder: (context, state) {
      Widget result = const SizedBox.shrink();
      if (state is SuccesLoadState) {
        result = PokeListLoaded(
          pokemonList: state.model.pokemonList,
        );
      }
      if (state is FailLoadState) {
        result = const PokeListFail();
      }
      if (state is EmptyListState) {
        result = const PokeListEmpty();
      }
      if (state is LoadingState) {
        result = const PokeListLoading();
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Poke List'),
          actions: [
            TextButton(
              onPressed: () {
                context.read<PokeListBloc>().add(
                      ShowErrorEvent(),
                    );
              },
              child: const Text(
                'Show error',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<PokeListBloc>().add(
                      ShowEmptyEvent(),
                    );
              },
              child: const Text(
                'Show empty',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: result,
      );
    });
  }
}
