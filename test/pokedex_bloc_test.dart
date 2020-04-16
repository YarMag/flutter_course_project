import 'package:flutter_test/flutter_test.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc.dart';
import 'package:start_app/business_logic/blocs/pokedex/pokedex_bloc_interface.dart';
import 'package:start_app/business_logic/repositories/dummy_pokemon_repository.dart';
import 'package:start_app/business_logic/repositories/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';

void main() {
  IPokemonRepository repo;

  setUp(() {
    repo = DummyPokemonRepository();
  });

  group("Pokedex bloc tests", () {
    test("Initial collection", () {
      final IPokedexBloc bloc = PokedexBloc(repository: repo);

      bloc.outPokemonSearchResults.listen(expectAsync1((List<PokemonModel> pokemons) {
        expect(pokemons.length, 9);
      }));
    });

    test("Search for request", () async {
      final IPokedexBloc bloc = PokedexBloc(repository: repo);
      final String searchString = "bulb";

      bloc.inPokemonSearch.add(searchString);

      List<PokemonModel> results = (await bloc.outPokemonSearchResults.take(2).toList())[1];
      expect(results.singleWhere((PokemonModel p) => p.name == "bulbasaur", orElse: () => null) != null, true);
      expect(results.firstWhere((PokemonModel p) => !p.name.contains(searchString), orElse: () => null), null);
    });
  });

  tearDown(() {
    repo = null;
  });
}
