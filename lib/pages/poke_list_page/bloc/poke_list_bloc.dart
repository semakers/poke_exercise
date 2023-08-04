import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise/model/pokemon_info.dart';
import 'package:http/http.dart' as http;

part 'poke_list_event.dart';
part 'poke_list_state.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  PokeListBloc({
    final http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        super(const InitState(
          model: Model(
            pokemonList: [],
          ),
        )) {
    on<LoadEvent>(_onLoadEvent);
    on<ShowErrorEvent>(_onShowErrorEvent);
    on<ShowEmptyEvent>(_onShowEmptyEvent);
  }

  final http.Client _httpClient;

  void _onShowErrorEvent(ShowErrorEvent event, emit) {
    emit(
      FailLoadState(
        model: state.model,
      ),
    );
  }

  void _onShowEmptyEvent(ShowEmptyEvent event, emit) {
    emit(
      EmptyListState(
        model: state.model,
      ),
    );
  }

  void _onLoadEvent(LoadEvent event, emit) async {
    emit(
      LoadingState(
        model: state.model,
      ),
    );
    try {
      final response = await _httpClient.get(
        Uri.parse(
          'https://db.pokemongohub.net/api/pokemon/with-generation/1',
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final pokemonList = pokemonInfoFromJson(response.body);
        if (pokemonList.isNotEmpty) {
          emit(
            SuccesLoadState(
              model: state.model.copyWith(
                pokemonList: pokemonList,
              ),
            ),
          );
        } else {
          emit(
            EmptyListState(
              model: state.model,
            ),
          );
        }
      } else {
        emit(
          FailLoadState(
            model: state.model,
          ),
        );
      }
    } catch (_) {
      emit(
        FailLoadState(
          model: state.model,
        ),
      );
    }
  }
}
