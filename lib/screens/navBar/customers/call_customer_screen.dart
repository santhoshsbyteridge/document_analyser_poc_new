import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallCustomerPage extends StatefulWidget {
  const CallCustomerPage({super.key});

  @override
  State<CallCustomerPage> createState() => _CallCustomerPageState();
}

class _CallCustomerPageState extends State<CallCustomerPage> {
  void stopRecordingBtnPressed() {
    context.read<CustomerPhoneCallBloc>().add(const StopRecordingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              // if (AppHelpers.getDevice(context) == Devices.mobile &&
              //     AppHelpers.getDevice(context) == Devices.smallMobile)
              _buildUIForMobile(),
              if (state is CallState && state.isCallStarted)
                ElevatedButton(
                  onPressed: stopRecordingBtnPressed,
                  child: const Text('Stop Recording'),
                )
            ],
          ),
        );
      },
    );
  }

  Column _buildUIForMobile() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Name: John Doe",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            "Phone: 123-456-7890",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            "Lead Source: XYZ",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            "Email: john@doe.com",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            "Address: 123 Main Street",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            "Call History Updated: Yes",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
        ],
      );
}
