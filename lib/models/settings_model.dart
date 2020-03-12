import 'package:flutter/foundation.dart';

enum Difficulty { easy, normal, hard }

class SettingsModel {
  int playerPokemonIndex;
  int cpuPokemonIndex;
  Difficulty difficulty;

  SettingsModel(
      {@required this.playerPokemonIndex,
      @required this.cpuPokemonIndex,
      @required this.difficulty});
}
