import 'package:start_app/business_logic/repositories/pokemon/pokemon_repository_interface.dart';
import 'package:start_app/models/pokemon/generation_model.dart';

import '../../../models/pokemon/pokemon_model.dart';
import '../../../models/pokemon/type_model.dart';

class DummyPokemonRepository implements IPokemonRepository {
  List<PokemonModel> getAllPokemons() {
    return [
      PokemonModel(id: 1, name: "bulbasaur"),
      PokemonModel(id: 4, name: "charmander"),
      PokemonModel(id: 7, name: "squirtle"),
      PokemonModel(id: 25, name: "pickachu"),
      PokemonModel(id: 54, name: "psyduck"),
      PokemonModel(id: 64, name: "kadabra"),
      PokemonModel(id: 93, name: "haunter"),
      PokemonModel(id: 130, name: "gyarados"),
      PokemonModel(id: 150, name: "mewto"),
    ];
  }

  List<PokemonModel> getPokemonsForGeneration(GenerationModel gen) {
    return null;
  }

  List<PokemonModel> getPokemonsForType(TypeModel type) {
    return null;
  }
}
