
import 'package:start_app/models/shape_model.dart';

class SpeciesModel {
  final int id;
  final String name;
  final double genderRate;
  final double captureRate;
  final String colorId;
  final ShapeModel shape;

  SpeciesModel({this.id, this.name, this.genderRate, this.captureRate, this.colorId, this.shape});
}