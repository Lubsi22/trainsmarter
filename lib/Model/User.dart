import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainsmarter/Model/Plan.dart';

class User {
  final String uName;
  final List<Plan>? plans;

  User({
    required this.uName,
    this.plans,
  });

  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
      final data = snapshot.data();
      return User(
        uName: data?['uName'],
        plans: data?['plans'] is Iterable ? List.from(data?['plans']) : null,
      );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uName' : uName,
      'plans' : plans,
    };
  }

}
