import 'package:flutter/material.dart';
import 'package:freestyle_exercise/model/ownExercise.dart';
import 'package:freestyle_exercise/pages/addOwnExercise.dart';

import 'package:freestyle_exercise/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Own Exercises'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddExercise()));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<OwnExercise>>(
        future: FirestoreService().readOwnExerciseData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data[index].exerciseTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text("Duration: " +
                            snapshot.data[index].duration +
                            " No. of Reps: " +
                            snapshot.data[index].noOfReps),
                        // Column(
                        //   children: [
                        //     Text(
                        //       "Duration: " + snapshot.data[index].duration,
                        //       style: TextStyle(
                        //           color: Colors.black, fontSize: 14.0),
                        //     ),
                        //     Text(
                        //       "No. of Reps: " + snapshot.data[index].noOfReps,
                        //       style: TextStyle(
                        //           color: Colors.black, fontSize: 12.0),
                        //     ),
                        //   ],
                        // ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            setState(() {
                              FirestoreService().deleteOwnExerciseData(
                                  snapshot.data[index].uid);
                            });
                            Fluttertoast.showToast(
                                msg: "Data deleted successfully",
                                gravity: ToastGravity.TOP);
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add your own exercises here.",
                    style: TextStyle(fontSize: 30)),
                SizedBox(height: 80),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 60,
                        tooltip: 'add exercise',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddExercise()));
                        },
                      ),
                    ]),
              ],
            );
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
} //_RecordsPageState
