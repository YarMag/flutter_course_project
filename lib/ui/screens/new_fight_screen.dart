import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/business_logic/blocs/common/bloc_provider.dart';
import 'package:start_app/business_logic/blocs/new_fight/new_fight_bloc_interface.dart';
import 'package:start_app/business_logic/di/builders.dart';
import 'package:start_app/models/fight_settings_model.dart';

class NewFightScreen extends StatefulWidget {
  final SingleFightScreenBuilder _singleFightScreenBuilder;

  NewFightScreen({@required singleFightScreenBuilder})
      : this._singleFightScreenBuilder = singleFightScreenBuilder;

  @override
  State<StatefulWidget> createState() => _NewFightScreenState();
}

class _NewFightScreenState extends State<NewFightScreen> {
  INewFightBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Fight settings"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
              child: Text("Start fight"),
              onPressed: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                    final FightSettingsModel settings = _bloc.getFightSettings();
                    return widget._singleFightScreenBuilder(settings);
                  })))
        ],
      ),
    );
  }
}
