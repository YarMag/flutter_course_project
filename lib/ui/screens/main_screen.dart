import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/di/builders.dart';

class MainScreen extends StatelessWidget {
  final NewFightScreenBuilder _newFightScreenBuilder;

  MainScreen({@required newFightScreenBuilder})
      : this._newFightScreenBuilder = newFightScreenBuilder;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
            child: Text("New fight"),
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        _newFightScreenBuilder())),
          )
        ],
      ),
    );
  }
}
