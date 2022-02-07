import 'package:flutter/material.dart';
import 'package:freestyle_exercise/services/firebaseauth_service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
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
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: nameController..text = user.displayName,
            decoration: InputDecoration(
              labelText: "Username:",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: emailController..text = user.email,
            decoration: InputDecoration(
              labelText: "Email:",
            ),
          ),
        ),
        RaisedButton(
          onPressed: () async {
            await FirebaseAuthService().updateDisplayName(nameController.text);
            Navigator.pop(context);
            await FirebaseAuthService().updateEmail(emailController.text);
          },
          child: Text("Save Changes"),
        )
      ],
    );
  }
}
