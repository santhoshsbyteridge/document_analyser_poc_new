// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranked_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankedPolicyImpl _$$RankedPolicyImplFromJson(Map<String, dynamic> json) =>
    _$RankedPolicyImpl(
      id: json['id'] as String,
      accuracy: json['accuracy'] as String,
      description: json['description'] as String,
      rank: json['rank'] as String,
      reason: json['reason'] as String,
      matchScore: (json['match_score'] as num).toInt(),
      policyName: json['policy_name'] as String,
      keyFeatures: (json['key_features'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RankedPolicyImplToJson(_$RankedPolicyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accuracy': instance.accuracy,
      'description': instance.description,
      'rank': instance.rank,
      'reason': instance.reason,
      'match_score': instance.matchScore,
      'policy_name': instance.policyName,
      'key_features': instance.keyFeatures,
    };
