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
      child: SingleChildScrollView(
        primary: false,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _wrappedImage(Images.pokemonLogo(), width: 340, height: 180)
                ],
              ),
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
              CupertinoButton(
                child: Text("Pokedex"),
                onPressed: () => print("Not implemented yet"),
              ),
              CupertinoButton(
                child: Text("Settings"),
                onPressed: () => print("Not implemented yet"),
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
        ),
      ),
    );
  }

  Widget _wrappedImage(Image img, {double width = 180, double height = 180}) =>
      Container(
        width: width,
        height: height,
        child: FittedBox(
          child: img,
          fit: BoxFit.fill,
        ),
      );
}
