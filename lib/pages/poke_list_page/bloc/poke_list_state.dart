part of 'poke_list_bloc.dart';

abstract class PokeListState extends Equatable {
  const PokeListState({
    required this.model,
  });

  final Model model;

  @override
  List<Object?> get props => [
        model,
      ];
}

class InitState extends PokeListState {
  const InitState({
    required super.model,
  });
}

class LoadingState extends PokeListState {
  const LoadingState({
    required super.model,
  });
}

class FailLoadState extends PokeListState {
  const FailLoadState({
    required super.model,
  });
}

class SuccesLoadState extends PokeListState {
  const SuccesLoadState({
    required super.model,
  });
}

class EmptyListState extends PokeListState {
  const EmptyListState({
    required super.model,
  });
}

class Model extends Equatable {
  const Model({
    required this.pokemonList,
  });

  final List<PokemonInfo> pokemonList;

  Model copyWith({
    List<PokemonInfo>? pokemonList,
  }) =>
      Model(
        pokemonList: pokemonList ?? this.pokemonList,
      );

  @override
  List<Object?> get props => [
        pokemonList,
      ];
}
