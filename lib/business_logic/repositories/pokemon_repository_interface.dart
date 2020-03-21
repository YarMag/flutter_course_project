import 'package:start_app/models/generation_model.dart';

import '../../models/pokemon/pokemon_model.dart';
import '../../models/pokemon/type_model.dart';

abstract class IPokemonRepository {
  List<PokemonModel> getAllPokemons();

  List<PokemonModel> getPokemonsForGeneration(GenerationModel gen);

  List<PokemonModel> getPokemonsForType(TypeModel type);
}
