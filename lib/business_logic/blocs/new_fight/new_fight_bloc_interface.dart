
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

abstract class INewFightBloc extends BlocBase {
  List<PokemonModel> getPlayerPokemons();

  List<PokemonModel> getCPUPokemons();

  FightSettingsModel getFightSettings();

  void updateDifficulty(Difficulty newDifficulty);

  void updatePlayerPokemon(PokemonModel pokemon);

  void updateCPUPokemon(PokemonModel pokemon);

  void onStartFightButton();
}