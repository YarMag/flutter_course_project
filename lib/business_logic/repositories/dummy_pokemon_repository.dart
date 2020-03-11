
import 'package:start_app/business_logic/repositories/ipokemon_repository.dart';
import 'package:start_app/models/generation_model.dart';

import '../../models/pokemon_model.dart';
import '../../models/type_model.dart';

class DummyPokemonRepository implements IPokemonRepository {
  List<PokemonModel> getPokemonsForGeneration(GenerationModel gen) {
    return null;
  }

  List<PokemonModel> getPokemonsForType(TypeModel type) {
    return null;
  }
}