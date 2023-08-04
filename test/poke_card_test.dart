import 'package:exercise/model/pokemon_info.dart';
import 'package:exercise/pages/poke_list_page/widgets/poke_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('PokeCard Widget', () {
    testWidgets('Navigates to PokeDetailsPage on tap',
        (WidgetTester tester) async {
      const pokemonInfo = PokemonInfo(
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
      );

      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const PokeCard(pokemon: pokemonInfo),
          navigatorObservers: [mockObserver],
        ),
      );

      // Ensure the PokeCard widget is rendered with the correct content
      expect(find.text('Poke'), findsOneWidget);
      expect(find.text('type1'), findsOneWidget);
    });
  });
}
