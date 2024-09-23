part of 'policy_bloc.dart';

sealed class PolicyEvent extends Equatable {
  const PolicyEvent();

  @override
  List<Object> get props => [];
}


class FetchRankedPolicies extends PolicyEvent {
  final String summary;

  const FetchRankedPolicies({required this.summary});

  @override
  List<Object> get props => [summary];
}
