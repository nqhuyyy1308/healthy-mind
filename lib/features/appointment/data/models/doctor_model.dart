import 'package:equatable/equatable.dart';
import 'package:healthy_mind_application/features/appointment/domain/entities/doctor_entity.dart';

class DoctorModel extends Equatable {
  final String id;
  final String img;
  final String jobTitle;
  final String name;

  const DoctorModel({
    required this.id,
    required this.img,
    required this.jobTitle,
    required this.name,
  });

  static final empty = DoctorModel(id: '', img: '', jobTitle: '', name: '');

  DoctorModel copyWith({
    String? id,
    String? img,
    String? jobTitle,
    String? name,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      img: img ?? this.img,
      jobTitle: jobTitle ?? this.jobTitle,
      name: name ?? this.name,
    );
  }

  bool get isEmpty => this == DoctorModel.empty;

  bool get isNotEmpty => this != DoctorModel.empty;

  DoctorEntity toEntity() {
    return DoctorEntity(id: id, img: img, jobTitle: jobTitle, name: name);
  }

  static DoctorModel fromEntity(DoctorEntity entity) {
    return DoctorModel(
      id: entity.id,
      img: entity.img,
      jobTitle: entity.jobTitle,
      name: entity.name,
    );
  }

  @override
  List<Object?> get props => [id, img, jobTitle, name];
}
