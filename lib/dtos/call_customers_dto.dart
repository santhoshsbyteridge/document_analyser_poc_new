class CallCustomersDto {
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String customerAddress;
  final String leadSource;
  final bool isCallHistoryUpdated;

  CallCustomersDto({
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.customerAddress,
    required this.leadSource,
    required this.isCallHistoryUpdated,
  });
}
