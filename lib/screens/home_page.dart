import 'package:flutter/material.dart';
import 'package:freestyle_exercise/pages/showOwnExercise.dart';
import 'package:freestyle_exercise/services/firebaseauth_service.dart';
import 'package:freestyle_exercise/pages/welcome.dart';
import 'package:freestyle_exercise/pages/addExercise.dart';
import 'package:freestyle_exercise/pages/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _listPages = List();

  @override
  void initState() {
    super.initState();

    _listPages..add(Welcome())..add(RecordsPage())..add(Profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _listPages[_currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        //shape property must be set to NotchedShape
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.run_circle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
} //HomePageState

Widget openBottomDrawer() {
  return Drawer(
    child: Column(
      children: <Widget>[
        //Add menu item to edit
        ListTile(
          leading: const Icon(Icons.mode_edit),
          title: const Text('Edit'),
          onTap: () {
            print('Edit tapped..');
          },
        ),
        ListTile(
          //Add menu item to add
          leading: const Icon(Icons.add),
          title: const Text('Add'),
          onTap: () {
            print('Add tapped..');
          },
        ),
      ],
    ),
  );
}
