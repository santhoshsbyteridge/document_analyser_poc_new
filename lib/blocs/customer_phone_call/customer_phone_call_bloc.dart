import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:document_analyser_poc_new/services/phone_call_service.dart';
import 'package:equatable/equatable.dart';

part 'customer_phone_call_event.dart';
part 'customer_phone_call_state.dart';

class CustomerPhoneCallBloc
    extends Bloc<CustomerPhoneCallEvent, CustomerPhoneCallState> {
  late PhoneCallService _phoneCallService;

  CustomerPhoneCallBloc(PhoneCallService phoneCallService)
      : super(CustomerPhoneCallBlocInitial()) {
    _phoneCallService = phoneCallService;
    on<RequestRecordPermissions>(_requestRecordPermissionsHandler);
    on<StartCallEvent>(_startCallEventHandler);
  }

  FutureOr<void> _requestRecordPermissionsHandler(
    RequestRecordPermissions event,
    Emitter<CustomerPhoneCallState> emit,
  ) {
    _phoneCallService.requestPermissions();
  }

  FutureOr<void> _startCallEventHandler(
    StartCallEvent event,
    Emitter<CustomerPhoneCallState> emit,
  ) async {
    String phoneNumber = event.phoneNumber;
    await _phoneCallService.makeCall(phoneNumber).then((value) {
      emit(const CallState(isCallStarted: true));
    });
  }
}
