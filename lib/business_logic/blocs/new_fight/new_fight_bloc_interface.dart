
import 'package:start_app/business_logic/blocs/common/base_bloc.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

enum NewFightParticipant {
  player,
  cpu
}

abstract class INewFightBloc extends BlocBase {
  void changeActiveParticipant(NewFightParticipant participant);

  List<PokemonModel> getPokemonsGridContent();

  FightSettingsModel getFightSettings();

  void updateDifficulty(Difficulty newDifficulty);

  void updateActiveParticipantPokemon(PokemonModel pokemon);

  void onStartFightButton();
}