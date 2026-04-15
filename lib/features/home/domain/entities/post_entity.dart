import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int id;
  final String content;
  final String userId;
  final bool isDeleted;
  final String createdAt;

  const PostEntity({
    required this.id,
    required this.content,
    required this.userId,
    required this.isDeleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, content, userId, isDeleted, createdAt];
}
