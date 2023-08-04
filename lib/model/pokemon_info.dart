import 'dart:convert';

import 'package:equatable/equatable.dart';

List<PokemonInfo> pokemonInfoFromJson(String str) => List<PokemonInfo>.from(
      json.decode(str).map(
            (x) => PokemonInfo.fromJson(x),
          ),
    );

String pokemonInfoToJson(List<PokemonInfo> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class PokemonInfo extends Equatable {
  final int id;
  final String? pokemonId;
  final String name;
  final dynamic form;
  final String type1;
  final String? type2;
  final int generation;
  final int atk;
  final int sta;
  final int def;
  final int maxcp;

  const PokemonInfo({
    required this.id,
    required this.pokemonId,
    required this.name,
    required this.form,
    required this.type1,
    required this.type2,
    required this.generation,
    required this.atk,
    required this.sta,
    required this.def,
    required this.maxcp,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => PokemonInfo(
        id: json["id"],
        pokemonId: json["pokemonId"],
        name: json["name"],
        form: json["form"],
        type1: json["type1"],
        type2: json["type2"],
        generation: json["generation"],
        atk: json["atk"],
        sta: json["sta"],
        def: json["def"],
        maxcp: json["maxcp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pokemonId": pokemonId,
        "name": name,
        "form": form,
        "type1": type1,
        "type2": type2,
        "generation": generation,
        "atk": atk,
        "sta": sta,
        "def": def,
        "maxcp": maxcp,
      };

  @override
  List<Object?> get props => [
        id,
        pokemonId,
        name,
        form,
        type1,
        type2,
        generation,
        atk,
        sta,
        def,
        maxcp,
      ];
}
