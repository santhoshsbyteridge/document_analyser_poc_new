import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/data/leads_dummy_data.dart';
import 'package:document_analyser_poc_new/screens/navBar/customers/widgets/header_ui.dart';
import 'package:document_analyser_poc_new/screens/navBar/customers/widgets/leads_details_list_ui.dart';
import 'package:document_analyser_poc_new/utils/app_colors.dart';
import 'package:document_analyser_poc_new/utils/app_enums.dart';
import 'package:document_analyser_poc_new/utils/app_helpers.dart';
import 'package:document_analyser_poc_new/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersPage extends StatefulWidget {
  final Widget? child;

  const CustomersPage({super.key, this.child});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
    context.read<CustomerPhoneCallBloc>().add(const RequestRecordPermissions());
  }

  @override
  Widget build(BuildContext context) {
    // Determine the device type using AppHelpers
    Devices device = AppHelpers.getDevice(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: device == Devices.webpage
            ? 8.0
            : 16.0, // More padding on large screens
        vertical: device == Devices.webpage ? 24.0 : 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeaderUI(),
          const SizedBox(height: 24.0),
          _buildSubHeaderWithSearchUI(device),
          const SizedBox(height: 24.0),
          // Adjust the leads list to expand fully and remain scrollable
          const Expanded(child: LeadsDetailsListUI(leads: dummyLeads))
        ],
      ),
    );
  }

  /// Builds the search header with responsive design
  Padding _buildSubHeaderWithSearchUI(Devices device) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.newLeads,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: device == Devices.webpage
                  ? 24.0
                  : 20.0, // Larger font for larger screens
            ),
          ),
          SizedBox(
            width: device == Devices.webpage
                ? 400
                : 200, // Adjust search box size based on device
            child: TextField(
              controller: _searchTextEditingController,
              decoration: InputDecoration(
                hintText: AppStrings.searchLeads,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: AppColors.grey400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: AppColors.blue),
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.grey500),
              ),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
