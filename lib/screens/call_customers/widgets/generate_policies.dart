import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:document_analyser_poc_new/blocs/policy/policy_bloc.dart'
    as ranked_policy;

class GeneratePolicies extends StatelessWidget {
  const GeneratePolicies({
    super.key,
  });

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
              return Column(
                children: state.rankedPolicies.map((policy) {
                  return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                policy.policyName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(policy.description),
                              const SizedBox(height: 16.0),
                              const Text(
                                "Key Features",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              ...policy.keyFeatures
                                  .map((feature) => Text(feature)),
                              const SizedBox(height: 16.0),
                              Text(
                                "Purchase Feasibility: ${policy.matchScore}%",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: policy.matchScore >= 80
                                      ? Colors.green
                                      : (policy.matchScore >= 50
                                          ? Colors.orange[600]
                                          : Colors.red),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              ElevatedButton.icon(
                                onPressed: () {},
                                label: const Text(
                                  "Proceed",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0f548c),
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }).toList(),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
