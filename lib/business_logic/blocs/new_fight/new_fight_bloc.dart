import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

class NewFightBloc extends INewFightBloc {
  final IPokemonRepository _repository;
  final FightSettingsModel _settings = FightSettingsModel();

  NewFightParticipant _activeParticipant;

  NewFightBloc({@required IPokemonRepository pokemonRepository})
      : this._repository = pokemonRepository {
    _settings.difficulty = Difficulty.normal;
    _settings.playerPokemon = _getPlayerPokemons()[0];
    _settings.cpuPokemon = _getCPUPokemons()[0];

    _activeParticipant = NewFightParticipant.player;
  }

  void changeActiveParticipant(NewFightParticipant participant) {
    _activeParticipant = participant;
  }

  List<PokemonModel> getPokemonsGridContent() {
    switch (_activeParticipant) {
      case NewFightParticipant.player:
        return _getPlayerPokemons();
      case NewFightParticipant.cpu:
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

  void updateActiveParticipantPokemon(PokemonModel pokemon) {
    switch (_activeParticipant) {
      case NewFightParticipant.player:
        _settings.playerPokemon = pokemon;
        break;
      case NewFightParticipant.cpu:
        _settings.cpuPokemon = pokemon;
        break;
      default:
        assert(false, "Should never reach there");
        break;
    }
  }


  void onStartFightButton() {}

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
