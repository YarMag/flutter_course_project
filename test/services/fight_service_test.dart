
import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/services/fight/easy_fight_service.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/fight/fight_state_model.dart';
import 'package:start_app/models/pokemon/ability/ability_model.dart';
import 'package:start_app/models/pokemon/ability/mental_attack_ability_model.dart';
import 'package:start_app/models/pokemon/ability/physical_attack_ability_model.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

void main() {

  PokemonModel playerPokemon;
  PokemonModel cpuPokemon;

  setUp(() {
    playerPokemon = PokemonModel(id: 1, name: "bulbasaur");
    cpuPokemon = PokemonModel(id: 150, name: "mewto");
  });

  group("Easy fight service tests", () {
      test("Init fight state", () {
          IFightService easyFightService = EasyFightService();
          easyFightService.createFightState(playerPokemon, cpuPokemon);
          FightStateModel fightState = easyFightService.getFightState();
          expect(fightState != null, true);
          expect(fightState.firstPokemon.hp > fightState.secondPokemon.hp, true);
          expect(fightState.firstPokemon.energy > fightState.secondPokemon.energy, true);
      });

      test("Apply player's ability", () {
          IFightService easyFightService = EasyFightService();
          easyFightService.createFightState(playerPokemon, cpuPokemon);
          FightStateModel fightState = easyFightService.getFightState();

          double enemyHpBeforeAttack = fightState.secondPokemon.hp;
          double playerEnergyBeforeAttack = fightState.firstPokemon.energy;
          AbilityModel playerAbility = PhysicalAttackAbilityModel(name: "Grass strike", shortDescription: "Basic attack", damageValue: 5, energyCost: 10);
          easyFightService.applyPlayerAbility(playerAbility);

          fightState = easyFightService.getFightState();
          expect(enemyHpBeforeAttack - fightState.secondPokemon.hp, 5.0);
          expect(playerEnergyBeforeAttack - fightState.firstPokemon.energy, 10.0);
      });

      test("Apply cpu's ability", () {
        IFightService easyFightService = EasyFightService();
        easyFightService.createFightState(playerPokemon, cpuPokemon);
        FightStateModel fightState = easyFightService.getFightState();

        double playerHpBeforeAttack = fightState.firstPokemon.hp;
        double enemyEnergyBeforeAttack = fightState.secondPokemon.energy;
        AbilityModel enemyAbility = MentalAttackAbilityModel(name: "Mind splash", shortDescription: "Basic mental attack", damageValue: 15, energyCost: 20);
        easyFightService.applyCpuAbility(enemyAbility);

        fightState = easyFightService.getFightState();
        expect(playerHpBeforeAttack - fightState.firstPokemon.hp, 15.0 * 1.5);
        expect(enemyEnergyBeforeAttack - fightState.secondPokemon.energy, 20.0);
      });
  });

  tearDown(() {

  });
}