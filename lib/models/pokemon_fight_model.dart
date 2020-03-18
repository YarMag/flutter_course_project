import 'package:flutter/foundation.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

class PokemonFightModel {
  final PokemonModel pokemon;
  final double hp;
  final double energy;

  PokemonFightModel(
      {@required this.pokemon, @required this.hp, @required this.energy});
}
