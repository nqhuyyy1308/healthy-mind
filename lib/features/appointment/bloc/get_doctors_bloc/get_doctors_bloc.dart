import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healthy_mind_application/features/appointment/data/models/doctor_model.dart';
import 'package:healthy_mind_application/features/appointment/domain/repositories/doctor_repository.dart';

part 'get_doctors_event.dart';
part 'get_doctors_state.dart';

class GetDoctorsBloc extends Bloc<GetDoctorsEvent, GetDoctorsState> {
  DoctorRepository _doctorRepository;
  GetDoctorsBloc({required DoctorRepository doctorRepository})
    : _doctorRepository = doctorRepository,
      super(GetDoctorsInitial()) {
    on<GetDoctors>((event, emit) async {
      emit(GetDoctorsLoading());
      try {
        List<DoctorModel> doctors = await _doctorRepository.getDoctors();
        emit(GetDoctorsSuccess(doctors: doctors));
      } catch (e) {
        emit(GetDoctorsFailure());
      }
    });
  }
}
