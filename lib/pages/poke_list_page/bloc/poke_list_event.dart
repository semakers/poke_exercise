part of 'poke_list_bloc.dart';

abstract class PokeListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadEvent extends PokeListEvent {}

class ShowErrorEvent extends PokeListEvent {}

class ShowEmptyEvent extends PokeListEvent {}
