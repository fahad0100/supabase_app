import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingInitialState extends LoadingState {}

class LoadingSuccessState extends LoadingState {
  final bool isLogin;

  const LoadingSuccessState({required this.isLogin});
}

class LoadingErrorState extends LoadingState {
  final String message;
  const LoadingErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
