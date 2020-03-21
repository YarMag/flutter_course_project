import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/models/pokemon/pokemon_model.dart';
import 'package:start_app/ui/constants/images.dart';

class PlayerPokemonAvatar extends StatefulWidget {
  final PokemonModel _pokemon;
  final NewFightPlayerType _playerType;
  final String _title;

  PlayerPokemonAvatar(this._playerType, this._pokemon, this._title);

  @override
  State<StatefulWidget> createState() => _PlayerPokemonAvatarState();
}

class _PlayerPokemonAvatarState extends State<PlayerPokemonAvatar> {
  INewFightBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            child: Text(widget._title, textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              decoration: widget._playerType == _bloc.getActiveParticipant()
                  ? BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1))
                  : null,
              child: FittedBox(
                child: Images.forPokemon(widget._pokemon),
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              setState(() {
                _bloc.changeActiveParticipant(widget._playerType);
              });
            },
          )
        ],
      ),
    );
  }
}