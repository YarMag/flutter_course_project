
import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/services/fight/easy_fight_service.dart';
import 'package:start_app/business_logic/services/fight/fight_service_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

void main() {
  setUp(() {

  });

  group("Easy fight service tests", () {
      test("Applying player's ability", () {
          PokemonModel cpuPokemon = PokemonModel(id: 1, name: "bulbasaur");
          IFightService easyFightService = EasyFightService();
          
          //easyFightService.applyPlayerAbility(cpuPokemon, ability)
      });
  });

  tearDown(() {

  });
}