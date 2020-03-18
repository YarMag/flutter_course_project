
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

class NewFightBloc extends INewFightBloc {
  List<PokemonModel> getPlayerPokemons() {
    return null;
  }

  List<PokemonModel> getCPUPokemons() {
    return null;
  }

  FightSettingsModel getFightSettings() {
    return FightSettingsModel(playerPokemonIndex: 0, cpuPokemonIndex: 0, difficulty: Difficulty.normal);
  }

  void updateDifficulty(Difficulty newDifficulty) {

  }

  void updatePlayerPokemon(PokemonModel pokemon) {

  }

  void updateCPUPokemon(PokemonModel pokemon) {

  }

  void onStartFightButton() {

  }

  @override
  void dispose() {
  }

}