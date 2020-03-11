import 'package:start_app/models/generation_model.dart';

import '../../models/pokemon_model.dart';
import '../../models/type_model.dart';

abstract class IPokemonRepository {
  List<PokemonModel> getPokemonsForGeneration(GenerationModel gen);

  List<PokemonModel> getPokemonsForType(TypeModel type);
}
