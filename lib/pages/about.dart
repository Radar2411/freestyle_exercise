import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About'),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                "FreeStyle Exercise contains a wide selection of exercises to choose from, ranging from core training to yoga. You can even add your own exercises to keep track of them!",
                style: TextStyle(fontSize: 25)),
          )
        ]));
  }
}
