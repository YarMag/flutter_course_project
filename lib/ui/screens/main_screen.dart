
import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text("New game"),
            onPressed: () => print(""),
          )
        ],
      ),
    );
  }
}
