import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainsmarter/Model/Exercise.dart';

class Plan{

  final String pName;
  final List<Exercise>? exercises;
  final int? totalKg;
  final int? totalSeries;

  Plan({
    required this.pName,
    this.exercises,
    this.totalKg,
    this.totalSeries,
  });

  factory Plan.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
      final data = snapshot.data();
      return Plan(
        pName: data?['pName'],
        exercises: data?['exercises'] is Iterable ? List.from(data?['exercises']) : null,
        totalKg: data?['totalKg'],
        totalSeries: data?['totalSeries'],
      );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'pName' : pName,
      'exercises' : exercises,
      'totalKg' : totalKg,
      'totalSeries' : totalSeries,
    };
  }

}