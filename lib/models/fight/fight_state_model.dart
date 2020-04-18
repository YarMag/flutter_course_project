import 'package:flutter/foundation.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/fight/pokemon_fight_model.dart';

enum TurnOwner { player, cpu }

class FightStateModel {
  final PokemonFightModel firstPokemon;
  final PokemonFightModel secondPokemon;
  final TurnOwner turnOwner;

  FightStateModel(
      {@required this.firstPokemon,
      @required this.secondPokemon,
      @required this.turnOwner});
}
