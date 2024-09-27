import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'ranked_policy.freezed.dart';

part 'ranked_policy.g.dart';

@freezed
class RankedPolicy with _$RankedPolicy {
  @JsonSerializable(explicitToJson: true)
  const factory RankedPolicy({
    required String id,
    required String accuracy,
    required String description,
    required String rank,
    required String reason,
    @JsonKey(name: "match_score") required int matchScore,
    @JsonKey(name: "policy_name") required String policyName,
    @JsonKey(name: "key_features") required List<String> keyFeatures,
  }) = _RankedPolicy;

  factory RankedPolicy.fromJson(Map<String, dynamic> json) =>
      _$RankedPolicyFromJson(json);
}
