part of 'get_doctors_bloc.dart';

sealed class GetDoctorsEvent extends Equatable {
  const GetDoctorsEvent();

  @override
  List<Object> get props => [];
}

class GetDoctors extends GetDoctorsEvent {}
