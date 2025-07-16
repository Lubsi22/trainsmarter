import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {

  final String eName;
  final List<String>? primaryMuscles;
  final List<String>? secondaryMuscles;
  final String? equipment;
  final int? series;
  final List<int>? kg;
  final List<int>? reps;


  Exercise({
    required this.eName,
    this.primaryMuscles,
    this.secondaryMuscles,
    this.equipment,
    this.series,
    this.kg,
    this.reps
  });

  factory Exercise.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
      final data = snapshot.data();
      return Exercise(
          eName: data?['eName'],
          primaryMuscles: data?['primaryMuscles'] is Iterable ? List.from(data?['primaryMuscles']) : null,
          secondaryMuscles: data?['secondaryMuscles'] is Iterable ? List.from(data?['secondaryMuscles']) : null,
          equipment: data?['equipment'],
          series: data?['series'],
          kg: data?['kg'] is Iterable ? List.from(data?['kg']) : null,
          reps: data?['reps'] is Iterable ? List.from(data?['reps']) : null,
      );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'eName': eName,
      'primaryMuscles': primaryMuscles,
      'secondaryMuscles' : secondaryMuscles,
      'equipment' : equipment,
      'series' : series,
      'kg' : kg,
      'reps' : reps,
    };
  }

}