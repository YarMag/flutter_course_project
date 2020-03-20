import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/models/fight_settings_model.dart';

class NewFightBloc extends INewFightBloc {
  List<PokemonModel> getPlayerPokemons() {
    return [
      PokemonModel(id: 1, name: "pickachu"),
      PokemonModel(id: 2, name: "bulbasaur"),
      PokemonModel(id: 3, name: "squirtle"),
      PokemonModel(id: 4, name: "charmander")
    ];
  }

  List<PokemonModel> getCPUPokemons() {
    return [
      PokemonModel(id: 5, name: "gyarados"),
      PokemonModel(id: 6, name: "haunter"),
      PokemonModel(id: 7, name: "kadabra"),
      PokemonModel(id: 8, name: "mewto")
    ];
  }

  FightSettingsModel getFightSettings() {
    return FightSettingsModel(
        playerPokemonIndex: 0,
        cpuPokemonIndex: 0,
        difficulty: Difficulty.normal);
  }

  void updateDifficulty(Difficulty newDifficulty) {}

  void updatePlayerPokemon(PokemonModel pokemon) {}

  void updateCPUPokemon(PokemonModel pokemon) {}

  void onStartFightButton() {}

  @override
  void dispose() {}
}
