
import 'package:start_app/models/species_model.dart';
import 'package:start_app/models/type_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final double height;
  final double weight;
  final SpeciesModel species;
  final List<TypeModel> types;

  PokemonModel({this.id, this.name, this.height, this.weight, this.species, this.types});
}