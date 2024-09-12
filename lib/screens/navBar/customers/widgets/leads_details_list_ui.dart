import 'package:document_analyser_poc_new/models/leads.dart';
import 'package:document_analyser_poc_new/screens/navBar/customers/widgets/actions_popup_menu.dart';
import 'package:document_analyser_poc_new/utils/app_colors.dart';
import 'package:document_analyser_poc_new/utils/app_enums.dart';
import 'package:document_analyser_poc_new/utils/app_helpers.dart'; // Import your AppHelpers class
import 'package:flutter/material.dart';

class LeadsDetailsListUI extends StatefulWidget {
  final List<Leads> leads;

  const LeadsDetailsListUI({
    super.key,
    required this.leads,
  });

  @override
  State<LeadsDetailsListUI> createState() => _LeadsDetailsListUIState();
}

class _LeadsDetailsListUIState extends State<LeadsDetailsListUI> {
  @override
  Widget build(BuildContext context) {
    // Determine the device type using AppHelpers
    Devices device = AppHelpers.getDevice(context);

    // Handle responsive design based on the device
    if (device == Devices.smallMobile || device == Devices.mobile) {
      return _buildMobileView();
    } else if (device == Devices.tablet || device == Devices.smallWebpage) {
      return _buildTabletView();
    } else {
      return _buildDesktopView();
    }
  }

  // Mobile View for small devices
  Widget _buildMobileView() {
    return ListView.builder(
      itemCount: widget.leads.length,
      itemBuilder: (context, index) {
        Leads lead = widget.leads[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lead Name: ${lead.leadName}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ActionsPopupMenuUI(
                      lead: lead,
                    ),
                    // Checkbox(
                    //   value: lead.contacted,
                    //   onChanged: (bool? value) {
                    //     // handle checkbox change
                    //   },
                    // ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Lead Source: ${lead.leadSource}'),
                const SizedBox(height: 4),
                Text('Lead Status: ${lead.leadStatus}'),
                const SizedBox(height: 4),
                Text('Contact Info: ${lead.contactInfo}'),
                const SizedBox(height: 4),
                Text('Notes: ${lead.notes}'),
                const SizedBox(height: 4),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabletView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(
                width: 1,
                color: AppColors.grey400,
                style: BorderStyle.solid,
              ),
            ),
            columnWidths: const {
              0: FixedColumnWidth(80), // SL No
              1: FixedColumnWidth(80), // Actions
              2: FixedColumnWidth(150), // Lead Name
              3: FixedColumnWidth(150), // Lead Source
              // Rest of the columns can be auto-sized
            },
            children: [
              _buildTableHeaderUI(),
              ..._buildTableBodyUI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(
                width: 1,
                color: AppColors.grey400,
                style: BorderStyle.solid,
              ),
            ),
            columnWidths: const {
              0: FixedColumnWidth(80), // SL No
              1: FixedColumnWidth(80), // Actions
            },
            children: [
              _buildTableHeaderUI(),
              ..._buildTableBodyUI(),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableHeaderUI() {
    List<String> tableHeaders = [
      'SL No',
      'Actions',
      'Lead Name',
      'Lead Source',
      'Lead Status',
      'Contact Information',
      'Mark as contacted',
      'Notes',
    ];
    return TableRow(
      children: tableHeaders
          .map(
            (header) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                header,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  List<TableRow> _buildTableBodyUI() {
    return widget.leads.asMap().entries.map(
      (entry) {
        int index = entry.key;
        Leads lead = entry.value;
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text((index + 1).toString()),
            ),
            ActionsPopupMenuUI(
              lead: lead,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadSource,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.leadStatus,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.contactInfo,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: lead.contacted,
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lead.notes,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    ).toList();
  }
}
