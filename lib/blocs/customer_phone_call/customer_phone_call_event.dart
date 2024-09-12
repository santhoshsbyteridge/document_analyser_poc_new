part of 'customer_phone_call_bloc.dart';

sealed class CustomerPhoneCallEvent extends Equatable {
  const CustomerPhoneCallEvent();

  @override
  List<Object> get props => [];
}

class RequestRecordPermissions extends CustomerPhoneCallEvent {
  const RequestRecordPermissions();

  @override
  List<Object> get props => [];
}

/// event to make a call
class StartCallEvent extends CustomerPhoneCallEvent {
  final String phoneNumber;

  const StartCallEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class StopRecordingEvent extends CustomerPhoneCallEvent {
  const StopRecordingEvent();

  @override
  List<Object> get props => [];
}

class GetCallSummary extends CustomerPhoneCallEvent {
  const GetCallSummary();

  @override
  List<Object> get props => [];
}