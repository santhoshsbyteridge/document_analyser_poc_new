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

final class CallState extends CustomerPhoneCallState {
  final bool isCallStarted;

  const CallState({required this.isCallStarted});

  @override
  List<Object> get props => [isCallStarted];
}
