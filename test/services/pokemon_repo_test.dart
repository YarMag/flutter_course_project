import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/repositories/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

void main() {

  IPokemonRepository repo;

  setUp(() {
    repo = DummyPokemonRepository();
  });
  group("Pokemon repo collection tests", () {

    test("Collection should not be null", () {
      List<PokemonModel> result = repo.getAllPokemons();

      expect(result.length > 0, true);
    });

    test("First pokemon is pikachu", () {
      List<PokemonModel> result = repo.getAllPokemons();

      expect(result[0].name == "pikachu", true);
    });

  });

  tearDown(() {
    repo = null;
  });
}