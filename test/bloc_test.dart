import 'package:exercise/model/pokemon_info.dart';
import 'package:exercise/pages/poke_list_page/bloc/poke_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('PokeListBloc', () {
    final client = MockClient();

    final testPokemonInfo = [
      const PokemonInfo(
        id: 0,
        pokemonId: 'POKE',
        name: 'Poke',
        form: 'form',
        type1: 'type1',
        type2: 'type2',
        generation: 1,
        atk: 1,
        sta: 1,
        def: 1,
        maxcp: 1,
      ),
    ];

    test('initial state is InitState', () {
      final bloc = PokeListBloc();
      expect(
        bloc.state,
        equals(
          const InitState(
            model: Model(
              pokemonList: [],
            ),
          ),
        ),
      );
    });

    blocTest<PokeListBloc, PokeListState>(
      'emits [LoadingState, SuccesLoadState] when successful',
      build: () => PokeListBloc(httpClient: client),
      act: (bloc) {
        when(
          client.get(
            Uri.parse(
              'https://db.pokemongohub.net/api/pokemon/with-generation/1',
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            pokemonInfoToJson(testPokemonInfo),
            200,
          ),
        );
        bloc.add(LoadEvent());
      },
      expect: () => [
        const LoadingState(
          model: Model(
            pokemonList: [],
          ),
        ),
        SuccesLoadState(
          model: Model(
            pokemonList: testPokemonInfo,
          ),
        ),
      ],
    );

    blocTest<PokeListBloc, PokeListState>(
      'emits [LoadingState, EmptyListState] when the API returns an empty list',
      build: () => PokeListBloc(httpClient: client),
      act: (bloc) {
        when(
          client.get(
            Uri.parse(
              'https://db.pokemongohub.net/api/pokemon/with-generation/1',
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            '[]',
            200,
          ),
        );
        bloc.add(LoadEvent());
      },
      expect: () => [
        const LoadingState(
          model: Model(
            pokemonList: [],
          ),
        ),
        const EmptyListState(
          model: Model(
            pokemonList: [],
          ),
        ),
      ],
    );

    blocTest<PokeListBloc, PokeListState>(
      'emits [LoadingState, FailLoadState] when the API returns an error',
      build: () => PokeListBloc(
        httpClient: client,
      ),
      act: (bloc) {
        when(
          client.get(
            Uri.parse(
              'https://db.pokemongohub.net/api/pokemon/with-generation/1',
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Not Found',
            404,
          ),
        );
        bloc.add(LoadEvent());
      },
      expect: () => [
        const LoadingState(
          model: Model(
            pokemonList: [],
          ),
        ),
        const FailLoadState(
          model: Model(
            pokemonList: [],
          ),
        ),
      ],
    );
  });
}
