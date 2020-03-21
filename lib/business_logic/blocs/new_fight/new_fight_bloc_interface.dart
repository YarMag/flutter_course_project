
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

enum NewFightPlayerType {
  player,
  cpu
}

abstract class INewFightBloc extends BlocBase {
  void changeActiveParticipant(NewFightPlayerType participant);

  NewFightPlayerType getActiveParticipant();

  List<PokemonModel> getPokemonsGridContent();

  FightSettingsModel getFightSettings();

  void updateDifficulty(Difficulty newDifficulty);

  void updateSelectedPokemon(PokemonModel pokemon);

  PokemonModel getActiveParticipantPokemon();

  void setOnUpdateRequiredCallback(Function callback);

  void onStartFightButton();
}