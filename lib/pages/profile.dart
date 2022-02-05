import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Icon(
        Icons.person,
        size: 120.0,
        color: Colors.orange,
      ),
    ));
  }
}
