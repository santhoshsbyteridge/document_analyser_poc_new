// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranked_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RankedPolicy _$RankedPolicyFromJson(Map<String, dynamic> json) {
  return _RankedPolicy.fromJson(json);
}

/// @nodoc
mixin _$RankedPolicy {
  String get id => throw _privateConstructorUsedError;
  String get accuracy => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: "match_score")
  int get matchScore => throw _privateConstructorUsedError;
  @JsonKey(name: "policy_name")
  String get policyName => throw _privateConstructorUsedError;
  @JsonKey(name: "key_features")
  List<String> get keyFeatures => throw _privateConstructorUsedError;

  /// Serializes this RankedPolicy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankedPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankedPolicyCopyWith<RankedPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankedPolicyCopyWith<$Res> {
  factory $RankedPolicyCopyWith(
          RankedPolicy value, $Res Function(RankedPolicy) then) =
      _$RankedPolicyCopyWithImpl<$Res, RankedPolicy>;
  @useResult
  $Res call(
      {String id,
      String accuracy,
      String description,
      String rank,
      String reason,
      @JsonKey(name: "match_score") int matchScore,
      @JsonKey(name: "policy_name") String policyName,
      @JsonKey(name: "key_features") List<String> keyFeatures});
}

/// @nodoc
class _$RankedPolicyCopyWithImpl<$Res, $Val extends RankedPolicy>
    implements $RankedPolicyCopyWith<$Res> {
  _$RankedPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankedPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accuracy = null,
    Object? description = null,
    Object? rank = null,
    Object? reason = null,
    Object? matchScore = null,
    Object? policyName = null,
    Object? keyFeatures = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      matchScore: null == matchScore
          ? _value.matchScore
          : matchScore // ignore: cast_nullable_to_non_nullable
              as int,
      policyName: null == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String,
      keyFeatures: null == keyFeatures
          ? _value.keyFeatures
          : keyFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankedPolicyImplCopyWith<$Res>
    implements $RankedPolicyCopyWith<$Res> {
  factory _$$RankedPolicyImplCopyWith(
          _$RankedPolicyImpl value, $Res Function(_$RankedPolicyImpl) then) =
      __$$RankedPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accuracy,
      String description,
      String rank,
      String reason,
      @JsonKey(name: "match_score") int matchScore,
      @JsonKey(name: "policy_name") String policyName,
      @JsonKey(name: "key_features") List<String> keyFeatures});
}

/// @nodoc
class __$$RankedPolicyImplCopyWithImpl<$Res>
    extends _$RankedPolicyCopyWithImpl<$Res, _$RankedPolicyImpl>
    implements _$$RankedPolicyImplCopyWith<$Res> {
  __$$RankedPolicyImplCopyWithImpl(
      _$RankedPolicyImpl _value, $Res Function(_$RankedPolicyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankedPolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accuracy = null,
    Object? description = null,
    Object? rank = null,
    Object? reason = null,
    Object? matchScore = null,
    Object? policyName = null,
    Object? keyFeatures = null,
  }) {
    return _then(_$RankedPolicyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      matchScore: null == matchScore
          ? _value.matchScore
          : matchScore // ignore: cast_nullable_to_non_nullable
              as int,
      policyName: null == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String,
      keyFeatures: null == keyFeatures
          ? _value._keyFeatures
          : keyFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RankedPolicyImpl with DiagnosticableTreeMixin implements _RankedPolicy {
  const _$RankedPolicyImpl(
      {required this.id,
      required this.accuracy,
      required this.description,
      required this.rank,
      required this.reason,
      @JsonKey(name: "match_score") required this.matchScore,
      @JsonKey(name: "policy_name") required this.policyName,
      @JsonKey(name: "key_features") required final List<String> keyFeatures})
      : _keyFeatures = keyFeatures;

  factory _$RankedPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankedPolicyImplFromJson(json);

  @override
  final String id;
  @override
  final String accuracy;
  @override
  final String description;
  @override
  final String rank;
  @override
  final String reason;
  @override
  @JsonKey(name: "match_score")
  final int matchScore;
  @override
  @JsonKey(name: "policy_name")
  final String policyName;
  final List<String> _keyFeatures;
  @override
  @JsonKey(name: "key_features")
  List<String> get keyFeatures {
    if (_keyFeatures is EqualUnmodifiableListView) return _keyFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyFeatures);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RankedPolicy(id: $id, accuracy: $accuracy, description: $description, rank: $rank, reason: $reason, matchScore: $matchScore, policyName: $policyName, keyFeatures: $keyFeatures)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RankedPolicy'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('accuracy', accuracy))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('reason', reason))
      ..add(DiagnosticsProperty('matchScore', matchScore))
      ..add(DiagnosticsProperty('policyName', policyName))
      ..add(DiagnosticsProperty('keyFeatures', keyFeatures));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankedPolicyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.matchScore, matchScore) ||
                other.matchScore == matchScore) &&
            (identical(other.policyName, policyName) ||
                other.policyName == policyName) &&
            const DeepCollectionEquality()
                .equals(other._keyFeatures, _keyFeatures));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accuracy,
      description,
      rank,
      reason,
      matchScore,
      policyName,
      const DeepCollectionEquality().hash(_keyFeatures));

  /// Create a copy of RankedPolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankedPolicyImplCopyWith<_$RankedPolicyImpl> get copyWith =>
      __$$RankedPolicyImplCopyWithImpl<_$RankedPolicyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankedPolicyImplToJson(
      this,
    );
  }
}

abstract class _RankedPolicy implements RankedPolicy {
  const factory _RankedPolicy(
      {required final String id,
      required final String accuracy,
      required final String description,
      required final String rank,
      required final String reason,
      @JsonKey(name: "match_score") required final int matchScore,
      @JsonKey(name: "policy_name") required final String policyName,
      @JsonKey(name: "key_features")
      required final List<String> keyFeatures}) = _$RankedPolicyImpl;

  factory _RankedPolicy.fromJson(Map<String, dynamic> json) =
      _$RankedPolicyImpl.fromJson;

  @override
  String get id;
  @override
  String get accuracy;
  @override
  String get description;
  @override
  String get rank;
  @override
  String get reason;
  @override
  @JsonKey(name: "match_score")
  int get matchScore;
  @override
  @JsonKey(name: "policy_name")
  String get policyName;
  @override
  @JsonKey(name: "key_features")
  List<String> get keyFeatures;

  /// Create a copy of RankedPolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankedPolicyImplCopyWith<_$RankedPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
