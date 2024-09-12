// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallSummary _$CallSummaryFromJson(Map<String, dynamic> json) {
  return _CallSummary.fromJson(json);
}

/// @nodoc
mixin _$CallSummary {
  @JsonKey(name: "recording_summary")
  String get callSummary => throw _privateConstructorUsedError;

  /// Serializes this CallSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallSummaryCopyWith<CallSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallSummaryCopyWith<$Res> {
  factory $CallSummaryCopyWith(
          CallSummary value, $Res Function(CallSummary) then) =
      _$CallSummaryCopyWithImpl<$Res, CallSummary>;
  @useResult
  $Res call({@JsonKey(name: "recording_summary") String callSummary});
}

/// @nodoc
class _$CallSummaryCopyWithImpl<$Res, $Val extends CallSummary>
    implements $CallSummaryCopyWith<$Res> {
  _$CallSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callSummary = null,
  }) {
    return _then(_value.copyWith(
      callSummary: null == callSummary
          ? _value.callSummary
          : callSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallSummaryImplCopyWith<$Res>
    implements $CallSummaryCopyWith<$Res> {
  factory _$$CallSummaryImplCopyWith(
          _$CallSummaryImpl value, $Res Function(_$CallSummaryImpl) then) =
      __$$CallSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "recording_summary") String callSummary});
}

/// @nodoc
class __$$CallSummaryImplCopyWithImpl<$Res>
    extends _$CallSummaryCopyWithImpl<$Res, _$CallSummaryImpl>
    implements _$$CallSummaryImplCopyWith<$Res> {
  __$$CallSummaryImplCopyWithImpl(
      _$CallSummaryImpl _value, $Res Function(_$CallSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CallSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callSummary = null,
  }) {
    return _then(_$CallSummaryImpl(
      callSummary: null == callSummary
          ? _value.callSummary
          : callSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallSummaryImpl with DiagnosticableTreeMixin implements _CallSummary {
  const _$CallSummaryImpl(
      {@JsonKey(name: "recording_summary") required this.callSummary});

  factory _$CallSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallSummaryImplFromJson(json);

  @override
  @JsonKey(name: "recording_summary")
  final String callSummary;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CallSummary(callSummary: $callSummary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CallSummary'))
      ..add(DiagnosticsProperty('callSummary', callSummary));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallSummaryImpl &&
            (identical(other.callSummary, callSummary) ||
                other.callSummary == callSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, callSummary);

  /// Create a copy of CallSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallSummaryImplCopyWith<_$CallSummaryImpl> get copyWith =>
      __$$CallSummaryImplCopyWithImpl<_$CallSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallSummaryImplToJson(
      this,
    );
  }
}

abstract class _CallSummary implements CallSummary {
  const factory _CallSummary(
      {@JsonKey(name: "recording_summary")
      required final String callSummary}) = _$CallSummaryImpl;

  factory _CallSummary.fromJson(Map<String, dynamic> json) =
      _$CallSummaryImpl.fromJson;

  @override
  @JsonKey(name: "recording_summary")
  String get callSummary;

  /// Create a copy of CallSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallSummaryImplCopyWith<_$CallSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
