part of 'policy_bloc.dart';

sealed class PolicyState extends Equatable {
  const PolicyState();

  @override
  List<Object> get props => [];
}

final class PolicyInitial extends PolicyState {}

class RankedPoliciesState extends PolicyState {
  final List<RankedPolicy> rankedPolicies;

  const RankedPoliciesState({required this.rankedPolicies});

  @override
  List<Object> get props => [rankedPolicies];
}

class PoliciesLoadingState extends PolicyState {
  final bool isLoading;

  const PoliciesLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class ErrorState extends PolicyState {
  final ErrorDetails error;

  const ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
