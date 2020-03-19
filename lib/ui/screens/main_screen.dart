import 'package:flutter/cupertino.dart';
import 'package:start_app/business_logic/di/builders.dart';
import 'package:start_app/ui/constants/images.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _wrappedImage(Images.bulbasaur()),
              _wrappedImage(Images.pickachu())
            ],
          ),
          CupertinoButton(
            child: Text("New fight"),
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        _newFightScreenBuilder())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _wrappedImage(Images.charmander()),
              _wrappedImage(Images.squirtle())
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _wrappedImage(Image img) => Container(
    width: 150,
    height: 150,
    child: FittedBox(
      child: img,
      fit: BoxFit.fill,
    ),
  );
}
