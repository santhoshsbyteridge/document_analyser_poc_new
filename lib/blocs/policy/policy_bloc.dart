import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:document_analyser_poc_new/models/error_details.dart';
import 'package:document_analyser_poc_new/models/ranked_policy.dart';
import 'package:document_analyser_poc_new/services/phone_call_service.dart';
import 'package:equatable/equatable.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  late PhoneCallService _phoneCallService;

  PolicyBloc(PhoneCallService phoneCallService) : super(PolicyInitial()) {
    _phoneCallService = phoneCallService;
    on<FetchRankedPolicies>(getRankedPolicies);
  }

  Future<void> getRankedPolicies(
    FetchRankedPolicies event,
    Emitter<PolicyState> emit,
  ) async {
    String callSummary = event.summary;
    print('event.summary  ${event.summary}');
    try {
      emit(const PoliciesLoadingState(isLoading: true));
      Either<ErrorDetails, List<RankedPolicy>> response =
          await _phoneCallService.getRankedPolicies(callSummary);

      print('response $response');
      // Handle the response
      response.fold(
        (error) => emit(ErrorState(error: error)),
        (data) {
          print('data : ');
          print(data);
          emit(RankedPoliciesState(rankedPolicies: data));
        },
      );
    } catch (e) {
      emit(ErrorState(error: ErrorDetails(errorMessage: e.toString())));
    }
  }
}
