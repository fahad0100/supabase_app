import 'package:equatable/equatable.dart';
import 'package:supabase_app/features/home/domain/entities/post_entity.dart';

class HomeEntity extends Equatable {
  final List<PostEntity> posts;

  const HomeEntity({required this.posts});

  @override
  List<Object?> get props => [posts];
}
