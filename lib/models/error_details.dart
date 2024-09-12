import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'error_details.freezed.dart';

/// Data class to get the error details
@freezed
class ErrorDetails with _$ErrorDetails {
  const factory ErrorDetails({
    required String errorMessage,
    @Default(500) int statusCode,
  }) = _ErrorDetails;
}
