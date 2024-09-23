import 'dart:async';
import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/blocs/policy/policy_bloc.dart'
    as ranked_policy;
import 'package:document_analyser_poc_new/models/leads.dart';
import 'package:document_analyser_poc_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class CallCustomerPage extends StatefulWidget {
  final Leads lead;
  const CallCustomerPage({super.key, required this.lead});

  @override
  State<CallCustomerPage> createState() => _CallCustomerPageState();
}

class _CallCustomerPageState extends State<CallCustomerPage> {
  bool _isCalling = false;
  Timer? _callTimer;
  int _elapsedTime = 0;
  late TextEditingController _callSummaryController;

  Map<String, Map<String, dynamic>> checklistItems = {
    "current_coverage": {
      "label": "Current Coverage",
      "checked": false,
    },
    "life_changes": {
      "label": "Life Changes",
      "checked": false,
    },
    "financial_goals": {
      "label": "Financial Goals",
      "checked": false,
    },
    "budget": {
      "label": "Budget",
      "checked": false,
    },
    "coverage_limits": {
      "label": "Coverage Limits",
      "checked": false,
    },
    "premium_costs": {
      "label": "Premium Costs",
      "checked": false,
    },
    "riders_benefits": {
      "label": "Riders & Benefits",
      "checked": false,
    },
    "policy_duration": {
      "label": "Policy Duration",
      "checked": false,
    },
  };

  void _getRankedPolicies(String summary) {
    context
        .read<ranked_policy.PolicyBloc>()
        .add(ranked_policy.FetchRankedPolicies(summary: summary));
  }

  @override
  void initState() {
    super.initState();
    _callSummaryController = TextEditingController();
  }

  void _getcallsummary() {
    context.read<CustomerPhoneCallBloc>().add(const GetCallSummary());
  }

  void _updateChecklistItem(String key, bool value) {
    setState(() {
      checklistItems[key]?['checked'] = value;
    });
  }

  @override
  void dispose() {
    _callTimer?.cancel();
    super.dispose();
  }

  void _toggleCall() {
    setState(() {
      _isCalling = !_isCalling;

      if (_isCalling) {
        _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _elapsedTime++;
          });
        });
      } else {
        _callTimer?.cancel();

        setState(() {
          _elapsedTime = 0;
        });
      }
    });
  }

  String _formatElapsedTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = AppHelpers.getDevice(context);

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: deviceType == Devices.webpage
            ? _buildUIForDesktop()
            : _buildUIForMobile());
  }

  Column _buildUIForDesktop() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.lead.leadName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: _toggleCall,
                            icon:
                                Icon(_isCalling ? Icons.call_end : Icons.phone),
                            label: Text(_isCalling
                                ? "End Call (${_formatElapsedTime(_elapsedTime)})"
                                : "Call Now"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _isCalling ? Colors.red : Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer Name:  ${widget.lead.leadName}"),
                                const SizedBox(height: 8.0),
                                Text("Email: ${widget.lead.contactInfo}"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone: ${widget.lead.contactInfo}"),
                                const SizedBox(height: 8.0),
                                const Text("Address: 123 Main St, City, State"),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lead Source: XYZ"),
                                SizedBox(height: 8.0),
                                Text("Call History Updated: Yes"),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Edit
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildMainContent(),
                  const SizedBox(height: 16.0),
                  _buildGeneratePoliciesSection()
                ],
              ),
            ),
          ),
        ],
      );

  Column _buildUIForMobile() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "John Doe",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: _toggleCall,
                            icon:
                                Icon(_isCalling ? Icons.call_end : Icons.phone),
                            label: Text(_isCalling
                                ? "End Call (${_formatElapsedTime(_elapsedTime)})"
                                : "Call Now"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _isCalling ? Colors.red : Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Name: ${widget.lead.leadName}"),
                            const SizedBox(height: 10),
                            Text("Email: ${widget.lead.contactInfo}"),
                            const SizedBox(height: 10),
                            const Text("Phone: 123-456-7890"),
                            const SizedBox(height: 10),
                            const Text("Address: 123 Main St, City, State"),
                            const SizedBox(height: 10),
                            const Text("Lead Source: XYZ"),
                            const SizedBox(height: 10),
                            const Text("Call History Updated: Yes"),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildMainContent(),
                  const SizedBox(height: 16.0),
                  _buildGeneratePoliciesSection()
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: _getcallsummary,
          icon: const Icon(
            Icons.auto_mode,
            color: Colors.white,
          ),
          label: const Text(
            "Summarize Call using AI",
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
        const SizedBox(height: 16.0),
        BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
          builder: (context, state) {
            if (state is LoadingState && state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Text(
                'Error: ${state.error.errorMessage}',
                style: const TextStyle(color: Colors.red),
              );
            } else {
              if (state is CallSummaryState) {
                _callSummaryController.text = state.callSummary;
              }
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Call Summary"),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _callSummaryController,
                              maxLines: 10,
                              decoration: InputDecoration(
                                hintText: (state is CallSummaryState)
                                    ? 'Call summary generated.'
                                    : 'No summary available...',
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(
                                    text: _callSummaryController.text),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard!'),
                                ),
                              );
                            },
                            tooltip: 'Copy to clipboard',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildGeneratePoliciesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () => _getRankedPolicies(_callSummaryController.text),
          label: const Text(
            "Generate Policies",
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
        const SizedBox(height: 16.0),
        BlocBuilder(
          builder: (context, state) {
            if (state is ranked_policy.ErrorState) {
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
                              Text(
                                "Purchase Feasibility: ${policy.matchScore}%",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
