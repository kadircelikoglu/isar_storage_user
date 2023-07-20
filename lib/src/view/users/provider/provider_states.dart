import 'package:equatable/equatable.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';

abstract class ProviderState extends Equatable {
  const ProviderState();

  @override
  List<Object> get props => [];
}

class InitialSearchState extends ProviderState {
  const InitialSearchState();
}

class SearchLoading extends ProviderState {}

class SearchEmpty extends ProviderState {}

class SearchLoaded extends ProviderState {
  final List<UserModel> users;

  const SearchLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class SearchError extends ProviderState {}
