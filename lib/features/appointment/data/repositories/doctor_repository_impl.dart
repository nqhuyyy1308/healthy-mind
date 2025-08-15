import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy_mind_application/features/appointment/data/models/doctor_model.dart';
import 'package:healthy_mind_application/features/appointment/domain/entities/doctor_entity.dart';
import 'package:healthy_mind_application/features/appointment/domain/repositories/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final doctorsCollection = FirebaseFirestore.instance.collection('doctors');
  @override
  Future<List<DoctorModel>> getDoctors() {
    try {
      return doctorsCollection.get().then(
        (value) => value.docs
            .map(
              (e) =>
                  DoctorModel.fromEntity(DoctorEntity.fromDocument(e.data())),
            )
            .toList(),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
