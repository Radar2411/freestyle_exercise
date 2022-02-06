import 'package:flutter/material.dart';
import 'package:freestyle_exercise/services/firestore_service.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AddExercise extends StatefulWidget {
  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  String exerciseName;
  String exerciseDuration;
  String numberOfReps;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adding Own Exercise'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Exercise Name'),
                  validator: (val) =>
                      val.length == 0 ? "Enter Exercise Name" : null,
                  onSaved: (val) => this.exerciseName = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Exercise Duration'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Exercise Duration' : null,
                  onSaved: (val) => this.exerciseDuration = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Number Of Reps'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Number Of Reps' : null,
                  onSaved: (val) => this.numberOfReps = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Add Exercise'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService()
        .addExerciseData(exerciseName, exerciseDuration, numberOfReps);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState
