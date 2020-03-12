
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon_model.dart';
import 'package:start_app/models/settings_model.dart';

class NewFightBloc extends BlocBase implements INewFightBloc {
  List<PokemonModel> getPlayerPokemons() {
    return null;
  }

  List<PokemonModel> getCPUPokemons() {
    return null;
  }

  SettingsModel getFightSettings() {
    return null;
  }

  void updateDifficulty(Difficulty newDifficulty) {

  }

  void updatePlayerPokemon(PokemonModel pokemon) {

  }

  void updateCPUPokemon(PokemonModel pokemon) {}

  void onStartFightButton() {}

}