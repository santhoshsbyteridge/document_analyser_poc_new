import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallCustomerPage extends StatefulWidget {
  const CallCustomerPage({super.key});

  @override
  State<CallCustomerPage> createState() => _CallCustomerPageState();
}

class _CallCustomerPageState extends State<CallCustomerPage> {
  void _getcallsummary() {
    context.read<CustomerPhoneCallBloc>().add(const GetCallSummary());
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

  _buildUIForDesktop() =>
      BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Name- John Doe"),
                            SizedBox(height: 8.0),
                            Text("Email: johndoe@example.com"),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone: 123-456-7890"),
                            SizedBox(height: 8.0),
                            Text("Address: 123 Main St, City, State"),
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
              ElevatedButton.icon(
                onPressed: _getcallsummary,
                icon: const Icon(Icons.auto_mode),
                label: const Text("Summarize Call using AI"),
              ),
              const SizedBox(height: 16.0),
              if (state is LoadingState && state.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (state is CallSummaryState)
                Text(state.callSummary)
              else if (state is ErrorState)
                Text(
                  'Error: ${state.error.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                )
              else
                _buildCallSummaryCard()
            ],
          );
        },
      );

  Card _buildCallSummaryCard() {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Call Summary"),
            SizedBox(height: 8.0),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Generating call summary...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildUIForMobile() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Customer Name- John Doe"),
                      SizedBox(height: 10),
                      Text("Email: johndoe@example.com"),
                      SizedBox(height: 10),
                      Text("Phone: 123-456-7890"),
                      SizedBox(height: 10),
                      Text("Address: 123 Main St, City, State"),
                      SizedBox(height: 10),
                      Text("Lead Source: XYZ"),
                      SizedBox(height: 10),
                      Text("Call History Updated: Yes"),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.auto_mode),
            label: const Text("Summarize Call using AI"),
          ),
          const SizedBox(height: 16.0),
          const Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Call Summary"),
                  SizedBox(height: 8.0),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Generating call summary...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
