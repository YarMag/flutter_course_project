
import 'package:start_app/models/pokemon_model.dart';
import 'package:start_app/models/settings_model.dart';

abstract class INewFightBloc {
  List<PokemonModel> getPlayerPokemons();

  List<PokemonModel> getCPUPokemons();

  SettingsModel getFightSettings();

  void updateDifficulty(Difficulty newDifficulty);

  void updatePlayerPokemon(PokemonModel pokemon);

  void updateCPUPokemon(PokemonModel pokemon);

  void onStartFightButton();
}