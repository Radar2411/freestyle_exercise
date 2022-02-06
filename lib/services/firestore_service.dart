import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freestyle_exercise/model/ownExercise.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  final CollectionReference ownExerciseCollection =
      FirebaseFirestore.instance.collection('ownExercises');

  Future<void> addExerciseData(
      String exerciseName, String exerciseDuration, String numberOfReps) async {
    var docRef = FirestoreService().ownExerciseCollection.doc();
    print('add docRef:' + docRef.id);

    await ownExerciseCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'exerciseTitle': exerciseName,
      'duration': exerciseDuration,
      'noOfReps': numberOfReps
    });
  } //addExerciseData

  Future<List<OwnExercise>> readOwnExerciseData() async {
    List<OwnExercise> ownExerciseList = [];
    QuerySnapshot snapshot = await ownExerciseCollection.get();

    snapshot.docs.forEach((document) {
      OwnExercise ownExercise = OwnExercise.fromMap(document.data());
      ownExerciseList.add(ownExercise);
    });

    print('OwnExerciseList: $ownExerciseList');
    return ownExerciseList;
  } //readExerciseData

  Future<void> deleteOwnExerciseData(String docId) async {
    ownExerciseCollection.doc(docId).delete();

    print('deleting uid:' + docId);
  } //deleteExerciseData

  Future<void> updateOwnExerciseData(
      String exerciseName, String exerciseDuration, String numberOfReps) async {
    var docRef = FirestoreService().ownExerciseCollection.doc();
    print('update docRef:' + docRef.id);

    await ownExerciseCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'exerciseTitle': exerciseName,
      'duration': exerciseDuration,
      'noOfReps': numberOfReps
    });
  } //updateExerciseData

  //for your reference
  Future<void> deleteOwnExerciseDoc() async {
    await ownExerciseCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteExerciseDoc

} //FirestoreService
