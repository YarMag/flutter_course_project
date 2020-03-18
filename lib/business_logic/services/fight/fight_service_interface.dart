
import 'package:start_app/models/pokemon/ability_model.dart';
import 'package:start_app/models/pokemon_fight_model.dart';

abstract class IFightService {
  void applyPlayerAbility(PokemonFightModel pokemonInFight, AbilityModel ability);
  void applyCPUAbility(PokemonFightModel pokemonInFight, AbilityModel ability);
  AbilityModel simulateAbilitySelection(PokemonFightModel playerPokemon, PokemonFightModel cpuPokemon);
}