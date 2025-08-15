import 'package:healthy_mind_application/features/appointment/data/models/doctor_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorModel>> getDoctors();
}
