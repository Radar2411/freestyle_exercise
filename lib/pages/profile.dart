import 'package:flutter/material.dart';
import 'package:freestyle_exercise/services/firebaseauth_service.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_box),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: FirebaseAuthService().getCurrentUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return displayUserInformation(context, snapshot);
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                  ],
                ))));
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Email: ${user.email}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
