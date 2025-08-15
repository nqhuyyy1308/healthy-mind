part of 'get_doctors_bloc.dart';

abstract class GetDoctorsState extends Equatable {
  const GetDoctorsState();

  @override
  List<Object> get props => [];
}

final class GetDoctorsInitial extends GetDoctorsState {}

final class GetDoctorsLoading extends GetDoctorsState {}

final class GetDoctorsSuccess extends GetDoctorsState {
  final List<DoctorModel> doctors;
  const GetDoctorsSuccess({required this.doctors});
}

final class GetDoctorsFailure extends GetDoctorsState {}
