import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? avatar;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  Map<String, Object?> toDocument() {
    return {'id': id, 'name': name, 'email': email, 'avatar': avatar};
  }

  static UserEntity fromDocument(Map<String, dynamic> document) {
    return UserEntity(
      id: document['id'] as String,
      name: document['name'] as String,
      email: document['email'] as String,
      avatar: document['avatar'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name, email, avatar];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id,
      name: $name,
      email: $email,
      avatar: $avatar
    }''';
  }
}
