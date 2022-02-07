import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freestyle_exercise/pages/addOwnExercise.dart';
import 'package:freestyle_exercise/pages/profile.dart';
import 'package:freestyle_exercise/pages/showOwnExercise.dart';
import 'package:freestyle_exercise/pages/welcome.dart';
import 'package:freestyle_exercise/screens/home_page.dart';
import 'package:freestyle_exercise/screens/login_page.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<User> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out.');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FreeStyle Exercise App',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/welcome': (context) => Welcome(),
        '/addexercise': (context) => AddExercise(),
        '/recordspage': (context) => RecordsPage(),
        '/profile': (context) => Profile(),
      },
      home:
          FirebaseAuth.instance.currentUser == null ? LoginPage() : HomePage(),
    );
  }
}
