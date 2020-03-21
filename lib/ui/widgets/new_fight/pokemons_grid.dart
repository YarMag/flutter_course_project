
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/ui/widgets/new_fight/pokemon_grid_cell.dart';

class PokemonsGrid extends StatefulWidget {

  final List<PokemonModel> _pokemons;

  PokemonsGrid(this._pokemons);

  @override
  State<StatefulWidget> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonsGrid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 400,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.9),
          children:
          widget._pokemons.map((PokemonModel p) =>
                PokemonGridCell(
                  pokemon: p,
                ),
          ).toList(),
        ),
      ),
    );
  }
}