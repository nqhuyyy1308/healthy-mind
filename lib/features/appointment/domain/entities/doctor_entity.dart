import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final String id;
  final String img;
  final String jobTitle;
  final String name;

  const DoctorEntity({
    required this.id,
    required this.img,
    required this.jobTitle,
    required this.name,
  });

  Map<String, Object?> toDocument() {
    return {'id': id, 'img': img, 'jobTitle': jobTitle, 'name': name};
  }

  static DoctorEntity fromDocument(Map<String, Object?> document) {
    return DoctorEntity(
      id: document['id'] as String,
      img: document['img'] as String,
      jobTitle: document['jobTitle'] as String,
      name: document['name'] as String,
    );
  }

  @override
  List<Object?> get props => [id, img, jobTitle, name];

  @override
  String toString() {
    return '''DoctorEntity: {
      id: $id,
      img: $img,
      jobTitle: $jobTitle,
      name: $name
    } ''';
  }
}
