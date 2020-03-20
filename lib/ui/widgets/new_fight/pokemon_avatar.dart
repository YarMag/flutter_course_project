
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonAvatar extends StatelessWidget {
  final Image _avatar;

  PokemonAvatar(this._avatar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black)
      ),
      child: FittedBox(
        child: _avatar,
        fit: BoxFit.fill,
      ),
    );
  }
}