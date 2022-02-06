class OwnExercise {
  String uid;
  String exerciseTitle;
  String duration;
  String noOfReps;

  OwnExercise({this.uid, this.exerciseTitle, this.duration, this.noOfReps});

  OwnExercise.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    exerciseTitle = data['exerciseTitle'];
    duration = data['duration'];
    noOfReps = data['noOfReps'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'exerciseTitle': exerciseTitle,
      'duration': duration,
      'noOfReps': noOfReps
    };
  }
}
