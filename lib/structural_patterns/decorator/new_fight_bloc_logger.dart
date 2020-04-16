
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/fight_settings_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
/*
class NewFightBlocLogger implements INewFightBloc {

  INewFightBloc _decoratee;

  NewFightBlocLogger(this._decoratee);

  void changeActiveParticipant(NewFightPlayerType participant) {
    _log("Active participant was changed to type $participant");
    _decoratee.changeActiveParticipant(participant);
  }

  NewFightPlayerType getActiveParticipant() {
    return _decoratee.getActiveParticipant();
  }

  List<PokemonModel> getPokemonsGridContent() {
    return _decoratee.getPokemonsGridContent();
  }

  FightSettingsModel getFightSettings() {
    return _decoratee.getFightSettings();
  }

  void updateDifficulty(Difficulty newDifficulty) {
    _log("Difficulty was changed to value $newDifficulty");
    _decoratee.updateDifficulty(newDifficulty);
  }

  void updateSelectedPokemon(PokemonModel pokemon) {
    _log("Pokemon ${pokemon.name} was selected");
    updateSelectedPokemon(pokemon);
  }

  PokemonModel getActiveParticipantPokemon() {
    return _decoratee.getActiveParticipantPokemon();
  }

  void onStartFightButton() {
    _log("Start button was pressed");
    _decoratee.onStartFightButton();
  }

  @override
  void dispose() {
    // TODO: implement
  }

  void _log(String message) {
    // call for system logger
  }
}
 */
