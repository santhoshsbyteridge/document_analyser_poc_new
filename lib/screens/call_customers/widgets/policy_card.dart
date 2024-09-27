import 'package:document_analyser_poc_new/models/ranked_policy.dart';
import 'package:document_analyser_poc_new/widgets/checkbox_tile.dart';
import 'package:flutter/material.dart';

class PolicyCard extends StatelessWidget {
  final RankedPolicy policy;
  final bool isChecked;
  final Function(bool?)? onChanged;

  const PolicyCard({
    super.key,
    required this.policy,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxTileWidget(
            isChecked: isChecked,
            onChanged: onChanged,
            title: policy.policyName,
          ),
          const Text(
            "Policy Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Card(
            elevation: 0, // Removes the shadow
            color: Colors.white, // Set the background color to white
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(policy.description),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Key Features",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 16.0),
          ...policy.keyFeatures.map((feature) => Text(feature)),
          const SizedBox(height: 16.0),
          Text(
            "Purchase Feasibility: ${policy.matchScore}%",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: policy.matchScore >= 80
                  ? Colors.green
                  : (policy.matchScore >= 50 ? Colors.orange[600] : Colors.red),
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
    );
  }
}
