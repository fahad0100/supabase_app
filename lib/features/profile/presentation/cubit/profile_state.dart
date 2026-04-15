import 'package:equatable/equatable.dart';
import 'package:supabase_app/core/common/entity/profile_entity.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileEntity profile;

  const ProfileSuccessState({required this.profile});
}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
