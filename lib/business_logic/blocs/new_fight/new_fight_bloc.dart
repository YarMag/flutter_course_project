import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

class NewFightBloc extends INewFightBloc {
  final IPokemonRepository _repository;
  final FightSettingsModel _settings = FightSettingsModel();

  NewFightPlayerType _activeParticipant;
  Function _onUpdateRequiredCallback;

  NewFightBloc({@required IPokemonRepository pokemonRepository})
      : this._repository = pokemonRepository {
    _settings.difficulty = Difficulty.normal;
    _settings.playerPokemon = _getPlayerPokemons()[0];
    _settings.cpuPokemon = _getCPUPokemons()[0];

    _activeParticipant = NewFightPlayerType.player;
  }

  void changeActiveParticipant(NewFightPlayerType participant) {
    _activeParticipant = participant;
    _onUpdateRequiredCallback();
  }

  NewFightPlayerType getActiveParticipant() {
    return _activeParticipant;
  }

  List<PokemonModel> getPokemonsGridContent() {
    switch (_activeParticipant) {
      case NewFightPlayerType.player:
        return _getPlayerPokemons();
      case NewFightPlayerType.cpu:
        return _getCPUPokemons();
      default:
        assert(false, "Should never reach there");
        return null;
    }
  }

  FightSettingsModel getFightSettings() {
    return _settings;
  }

  void updateDifficulty(Difficulty newDifficulty) {
    _settings.difficulty = newDifficulty;
  }

  void updateSelectedPokemon(PokemonModel pokemon) {
    switch (_activeParticipant) {
      case NewFightPlayerType.player:
        _settings.playerPokemon = pokemon;
        break;
      case NewFightPlayerType.cpu:
        _settings.cpuPokemon = pokemon;
        break;
      default:
        assert(false, "Should never reach there");
        break;
    }
    if (_onUpdateRequiredCallback != null) {
      _onUpdateRequiredCallback();
    }
  }

  PokemonModel getActiveParticipantPokemon() {
    switch (_activeParticipant) {
      case NewFightPlayerType.player:
        return _settings.playerPokemon;
      case NewFightPlayerType.cpu:
        return _settings.cpuPokemon;
      default:
        assert(false, "Should never reach there");
        break;
    }
    return null;
  }

  void onStartFightButton() {

  }

  void setOnUpdateRequiredCallback(Function callback) {
    _onUpdateRequiredCallback = callback;
  }

  @override
  void dispose() {}

  List<PokemonModel> _getPlayerPokemons() {
    List<PokemonModel> allPokemons = _repository.getAllPokemons();
    assert(allPokemons.length > 4);
    return allPokemons.sublist(0, 4);
  }

  List<PokemonModel> _getCPUPokemons() {
    List<PokemonModel> allPokemons = _repository.getAllPokemons();
    assert(allPokemons.length > 4);
    return allPokemons.sublist(allPokemons.length - 4, allPokemons.length);
  }

}
