part of '../poke_list_page.dart';

class PokeListLoading extends StatelessWidget {
  const PokeListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
