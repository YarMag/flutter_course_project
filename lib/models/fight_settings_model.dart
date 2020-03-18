import 'package:flutter/foundation.dart';

enum Difficulty { easy, normal, hard }

class FightSettingsModel {
  int playerPokemonIndex;
  int cpuPokemonIndex;
  Difficulty difficulty;

  FightSettingsModel(
      {@required this.playerPokemonIndex,
      @required this.cpuPokemonIndex,
      @required this.difficulty});
}
