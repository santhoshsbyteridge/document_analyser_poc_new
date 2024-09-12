part of 'customer_phone_call_bloc.dart';

sealed class CustomerPhoneCallState extends Equatable {
  const CustomerPhoneCallState();

  @override
  List<Object> get props => [];
}

final class CustomerPhoneCallBlocInitial extends CustomerPhoneCallState {}

final class PermissionState extends CustomerPhoneCallState {
  const PermissionState();

  @override
  List<Object> get props => [];
}

final class InitalCallScreenState extends CustomerPhoneCallState {
  const InitalCallScreenState();

  @override
  List<Object> get props => [];
}

final class CallState extends CustomerPhoneCallState {
  final bool isCallStarted;

  const CallState({required this.isCallStarted});

  @override
  List<Object> get props => [isCallStarted];
}

final class CallSummaryState extends CustomerPhoneCallState {
  final String callSummary;

  const CallSummaryState({required this.callSummary});

  @override
  List<Object> get props => [callSummary];
}

final class ErrorState extends CustomerPhoneCallState {
  final ErrorDetails error;

  const ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

final class LoadingState extends CustomerPhoneCallState {
  final bool isLoading;

  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}
