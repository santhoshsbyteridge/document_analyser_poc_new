import 'package:document_analyser_poc_new/models/ranked_policy.dart';
import 'package:document_analyser_poc_new/screens/call_customers/widgets/policy_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:document_analyser_poc_new/blocs/policy/policy_bloc.dart'
    as ranked_policy;

class GeneratePolicies extends StatefulWidget {
  const GeneratePolicies({super.key});

  @override
  State<GeneratePolicies> createState() => _GeneratePoliciesState();
}

class _GeneratePoliciesState extends State<GeneratePolicies> {
  Map<String, bool> _checkedPolicies = {}; // Key is policy ID or index

  void _policyCheckBoxOnClickedHandler(bool? value, RankedPolicy rankedPolicy) {
    setState(() {
      // Update the checked status when the checkbox is clicked
      _checkedPolicies[rankedPolicy.id] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        BlocBuilder<ranked_policy.PolicyBloc, ranked_policy.PolicyState>(
          builder: (context, state) {
            if (state is ranked_policy.PoliciesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ranked_policy.ErrorState) {
              return Text(
                'Error: ${state.error.errorMessage}',
                style: const TextStyle(color: Colors.red),
              );
            } else if (state is ranked_policy.RankedPoliciesState) {
              if (_checkedPolicies.isEmpty) {
                _checkedPolicies = {
                  for (var policy in state.rankedPolicies) policy.id: false
                };
              }

              return _buildPolicyCardListUI(state);
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }

  Widget _buildPolicyCardListUI(ranked_policy.RankedPoliciesState state) {
    List<RankedPolicy> rankedPolicies = state.rankedPolicies;

    return Column(
      children: rankedPolicies.map((rankedPolicy) {
        // Get the current checked status for the policy
        bool isChecked = _checkedPolicies[rankedPolicy.id] ?? false;

        return PolicyCard(
          policy: rankedPolicy,
          isChecked: isChecked,
          onChanged: (val) =>
              _policyCheckBoxOnClickedHandler(val, rankedPolicy),
        );
      }).toList(),
    );
  }
}
