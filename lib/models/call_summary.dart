import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'call_summary.freezed.dart';

part 'call_summary.g.dart';

/// Data class to get call summary data
@freezed
class CallSummary with _$CallSummary {
  const factory CallSummary({
    @JsonKey(name: "recording_summary") required String callSummary,
  }) = _CallSummary;

  factory CallSummary.fromJson(Map<String, dynamic> json) =>
      _$CallSummaryFromJson(json);
}
