import 'package:equatable/equatable.dart';
import 'package:supabase_app/features/home/domain/entities/post_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<PostEntity> posts;

  const HomeSuccessState({required this.posts});
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
