import 'dart:async';
import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    _callSummaryController = TextEditingController();
  }

  void _getcallsummary() {
    context.read<CustomerPhoneCallBloc>().add(const GetCallSummary());
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
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "John Doe",
                    widget.lead.leadName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _toggleCall,
                    icon: Icon(_isCalling ? Icons.call_end : Icons.phone),
                    label: Text(_isCalling
                        ? "End Call (${_formatElapsedTime(_elapsedTime)})"
                        : "Call Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isCalling ? Colors.red : Colors.green,
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
        ],
      );

  Column _buildUIForMobile() => Column(
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
                    icon: Icon(_isCalling ? Icons.call_end : Icons.phone),
                    label: Text(_isCalling
                        ? "End Call (${_formatElapsedTime(_elapsedTime)})"
                        : "Call Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isCalling ? Colors.red : Colors.green,
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
        ],
      );

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: _getcallsummary,
          icon: const Icon(Icons.auto_mode),
          label: const Text("Summarize Call using AI"),
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
}
