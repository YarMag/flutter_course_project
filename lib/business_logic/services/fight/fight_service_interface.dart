
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

abstract class IFightService {
  FightStateModel getFightState();
  void createFightState(PokemonModel first, PokemonModel second);
  void applyPlayerAbility(AbilityModel ability);
  void applyCpuAbility(AbilityModel ability);
  /*
  void applyPlayerAbility(PokemonFightModel pokemonInFight, AbilityModel ability);
  void applyCPUAbility(PokemonFightModel pokemonInFight, AbilityModel ability);
  AbilityModel simulateAbilitySelection(PokemonFightModel playerPokemon, PokemonFightModel cpuPokemon);

   */
}