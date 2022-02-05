import 'package:flutter/material.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Icon(
        Icons.run_circle,
        size: 120.0,
        color: Colors.orange,
      ),
    ));
  }
}
