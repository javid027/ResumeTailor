// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tailoring_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TailoringResult {

 String get id; String get resumeId; String get jobDescriptionId; ResumeSections get originalSections; ResumeSections? get tailoredSections; List<BulletDiff> get perBulletDiffs; double get atsScoreBefore; double? get atsScoreAfter; List<String> get unmatchedRequirements; TailoringStatus get status; String? get failureReason; DateTime get consentGivenAt; ResumeSections? get finalSections; List<String> get acceptedBulletIds; DateTime? get acceptedAt; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringResultCopyWith<TailoringResult> get copyWith => _$TailoringResultCopyWithImpl<TailoringResult>(this as TailoringResult, _$identity);

  /// Serializes this TailoringResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringResult&&(identical(other.id, id) || other.id == id)&&(identical(other.resumeId, resumeId) || other.resumeId == resumeId)&&(identical(other.jobDescriptionId, jobDescriptionId) || other.jobDescriptionId == jobDescriptionId)&&(identical(other.originalSections, originalSections) || other.originalSections == originalSections)&&(identical(other.tailoredSections, tailoredSections) || other.tailoredSections == tailoredSections)&&const DeepCollectionEquality().equals(other.perBulletDiffs, perBulletDiffs)&&(identical(other.atsScoreBefore, atsScoreBefore) || other.atsScoreBefore == atsScoreBefore)&&(identical(other.atsScoreAfter, atsScoreAfter) || other.atsScoreAfter == atsScoreAfter)&&const DeepCollectionEquality().equals(other.unmatchedRequirements, unmatchedRequirements)&&(identical(other.status, status) || other.status == status)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.consentGivenAt, consentGivenAt) || other.consentGivenAt == consentGivenAt)&&(identical(other.finalSections, finalSections) || other.finalSections == finalSections)&&const DeepCollectionEquality().equals(other.acceptedBulletIds, acceptedBulletIds)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resumeId,jobDescriptionId,originalSections,tailoredSections,const DeepCollectionEquality().hash(perBulletDiffs),atsScoreBefore,atsScoreAfter,const DeepCollectionEquality().hash(unmatchedRequirements),status,failureReason,consentGivenAt,finalSections,const DeepCollectionEquality().hash(acceptedBulletIds),acceptedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TailoringResult(id: $id, resumeId: $resumeId, jobDescriptionId: $jobDescriptionId, originalSections: $originalSections, tailoredSections: $tailoredSections, perBulletDiffs: $perBulletDiffs, atsScoreBefore: $atsScoreBefore, atsScoreAfter: $atsScoreAfter, unmatchedRequirements: $unmatchedRequirements, status: $status, failureReason: $failureReason, consentGivenAt: $consentGivenAt, finalSections: $finalSections, acceptedBulletIds: $acceptedBulletIds, acceptedAt: $acceptedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TailoringResultCopyWith<$Res>  {
  factory $TailoringResultCopyWith(TailoringResult value, $Res Function(TailoringResult) _then) = _$TailoringResultCopyWithImpl;
@useResult
$Res call({
 String id, String resumeId, String jobDescriptionId, ResumeSections originalSections, ResumeSections? tailoredSections, List<BulletDiff> perBulletDiffs, double atsScoreBefore, double? atsScoreAfter, List<String> unmatchedRequirements, TailoringStatus status, String? failureReason, DateTime consentGivenAt, ResumeSections? finalSections, List<String> acceptedBulletIds, DateTime? acceptedAt, DateTime createdAt, DateTime updatedAt
});


$ResumeSectionsCopyWith<$Res> get originalSections;$ResumeSectionsCopyWith<$Res>? get tailoredSections;$ResumeSectionsCopyWith<$Res>? get finalSections;

}
/// @nodoc
class _$TailoringResultCopyWithImpl<$Res>
    implements $TailoringResultCopyWith<$Res> {
  _$TailoringResultCopyWithImpl(this._self, this._then);

  final TailoringResult _self;
  final $Res Function(TailoringResult) _then;

/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resumeId = null,Object? jobDescriptionId = null,Object? originalSections = null,Object? tailoredSections = freezed,Object? perBulletDiffs = null,Object? atsScoreBefore = null,Object? atsScoreAfter = freezed,Object? unmatchedRequirements = null,Object? status = null,Object? failureReason = freezed,Object? consentGivenAt = null,Object? finalSections = freezed,Object? acceptedBulletIds = null,Object? acceptedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resumeId: null == resumeId ? _self.resumeId : resumeId // ignore: cast_nullable_to_non_nullable
as String,jobDescriptionId: null == jobDescriptionId ? _self.jobDescriptionId : jobDescriptionId // ignore: cast_nullable_to_non_nullable
as String,originalSections: null == originalSections ? _self.originalSections : originalSections // ignore: cast_nullable_to_non_nullable
as ResumeSections,tailoredSections: freezed == tailoredSections ? _self.tailoredSections : tailoredSections // ignore: cast_nullable_to_non_nullable
as ResumeSections?,perBulletDiffs: null == perBulletDiffs ? _self.perBulletDiffs : perBulletDiffs // ignore: cast_nullable_to_non_nullable
as List<BulletDiff>,atsScoreBefore: null == atsScoreBefore ? _self.atsScoreBefore : atsScoreBefore // ignore: cast_nullable_to_non_nullable
as double,atsScoreAfter: freezed == atsScoreAfter ? _self.atsScoreAfter : atsScoreAfter // ignore: cast_nullable_to_non_nullable
as double?,unmatchedRequirements: null == unmatchedRequirements ? _self.unmatchedRequirements : unmatchedRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TailoringStatus,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,consentGivenAt: null == consentGivenAt ? _self.consentGivenAt : consentGivenAt // ignore: cast_nullable_to_non_nullable
as DateTime,finalSections: freezed == finalSections ? _self.finalSections : finalSections // ignore: cast_nullable_to_non_nullable
as ResumeSections?,acceptedBulletIds: null == acceptedBulletIds ? _self.acceptedBulletIds : acceptedBulletIds // ignore: cast_nullable_to_non_nullable
as List<String>,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res> get originalSections {
  
  return $ResumeSectionsCopyWith<$Res>(_self.originalSections, (value) {
    return _then(_self.copyWith(originalSections: value));
  });
}/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res>? get tailoredSections {
    if (_self.tailoredSections == null) {
    return null;
  }

  return $ResumeSectionsCopyWith<$Res>(_self.tailoredSections!, (value) {
    return _then(_self.copyWith(tailoredSections: value));
  });
}/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res>? get finalSections {
    if (_self.finalSections == null) {
    return null;
  }

  return $ResumeSectionsCopyWith<$Res>(_self.finalSections!, (value) {
    return _then(_self.copyWith(finalSections: value));
  });
}
}


/// Adds pattern-matching-related methods to [TailoringResult].
extension TailoringResultPatterns on TailoringResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TailoringResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TailoringResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TailoringResult value)  $default,){
final _that = this;
switch (_that) {
case _TailoringResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TailoringResult value)?  $default,){
final _that = this;
switch (_that) {
case _TailoringResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String resumeId,  String jobDescriptionId,  ResumeSections originalSections,  ResumeSections? tailoredSections,  List<BulletDiff> perBulletDiffs,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  TailoringStatus status,  String? failureReason,  DateTime consentGivenAt,  ResumeSections? finalSections,  List<String> acceptedBulletIds,  DateTime? acceptedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TailoringResult() when $default != null:
return $default(_that.id,_that.resumeId,_that.jobDescriptionId,_that.originalSections,_that.tailoredSections,_that.perBulletDiffs,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.status,_that.failureReason,_that.consentGivenAt,_that.finalSections,_that.acceptedBulletIds,_that.acceptedAt,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String resumeId,  String jobDescriptionId,  ResumeSections originalSections,  ResumeSections? tailoredSections,  List<BulletDiff> perBulletDiffs,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  TailoringStatus status,  String? failureReason,  DateTime consentGivenAt,  ResumeSections? finalSections,  List<String> acceptedBulletIds,  DateTime? acceptedAt,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TailoringResult():
return $default(_that.id,_that.resumeId,_that.jobDescriptionId,_that.originalSections,_that.tailoredSections,_that.perBulletDiffs,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.status,_that.failureReason,_that.consentGivenAt,_that.finalSections,_that.acceptedBulletIds,_that.acceptedAt,_that.createdAt,_that.updatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String resumeId,  String jobDescriptionId,  ResumeSections originalSections,  ResumeSections? tailoredSections,  List<BulletDiff> perBulletDiffs,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  TailoringStatus status,  String? failureReason,  DateTime consentGivenAt,  ResumeSections? finalSections,  List<String> acceptedBulletIds,  DateTime? acceptedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TailoringResult() when $default != null:
return $default(_that.id,_that.resumeId,_that.jobDescriptionId,_that.originalSections,_that.tailoredSections,_that.perBulletDiffs,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.status,_that.failureReason,_that.consentGivenAt,_that.finalSections,_that.acceptedBulletIds,_that.acceptedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TailoringResult implements TailoringResult {
  const _TailoringResult({required this.id, required this.resumeId, required this.jobDescriptionId, required this.originalSections, this.tailoredSections, required final  List<BulletDiff> perBulletDiffs, required this.atsScoreBefore, this.atsScoreAfter, required final  List<String> unmatchedRequirements, required this.status, this.failureReason, required this.consentGivenAt, this.finalSections, required final  List<String> acceptedBulletIds, this.acceptedAt, required this.createdAt, required this.updatedAt}): _perBulletDiffs = perBulletDiffs,_unmatchedRequirements = unmatchedRequirements,_acceptedBulletIds = acceptedBulletIds;
  factory _TailoringResult.fromJson(Map<String, dynamic> json) => _$TailoringResultFromJson(json);

@override final  String id;
@override final  String resumeId;
@override final  String jobDescriptionId;
@override final  ResumeSections originalSections;
@override final  ResumeSections? tailoredSections;
 final  List<BulletDiff> _perBulletDiffs;
@override List<BulletDiff> get perBulletDiffs {
  if (_perBulletDiffs is EqualUnmodifiableListView) return _perBulletDiffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perBulletDiffs);
}

@override final  double atsScoreBefore;
@override final  double? atsScoreAfter;
 final  List<String> _unmatchedRequirements;
@override List<String> get unmatchedRequirements {
  if (_unmatchedRequirements is EqualUnmodifiableListView) return _unmatchedRequirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unmatchedRequirements);
}

@override final  TailoringStatus status;
@override final  String? failureReason;
@override final  DateTime consentGivenAt;
@override final  ResumeSections? finalSections;
 final  List<String> _acceptedBulletIds;
@override List<String> get acceptedBulletIds {
  if (_acceptedBulletIds is EqualUnmodifiableListView) return _acceptedBulletIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedBulletIds);
}

@override final  DateTime? acceptedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TailoringResultCopyWith<_TailoringResult> get copyWith => __$TailoringResultCopyWithImpl<_TailoringResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TailoringResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TailoringResult&&(identical(other.id, id) || other.id == id)&&(identical(other.resumeId, resumeId) || other.resumeId == resumeId)&&(identical(other.jobDescriptionId, jobDescriptionId) || other.jobDescriptionId == jobDescriptionId)&&(identical(other.originalSections, originalSections) || other.originalSections == originalSections)&&(identical(other.tailoredSections, tailoredSections) || other.tailoredSections == tailoredSections)&&const DeepCollectionEquality().equals(other._perBulletDiffs, _perBulletDiffs)&&(identical(other.atsScoreBefore, atsScoreBefore) || other.atsScoreBefore == atsScoreBefore)&&(identical(other.atsScoreAfter, atsScoreAfter) || other.atsScoreAfter == atsScoreAfter)&&const DeepCollectionEquality().equals(other._unmatchedRequirements, _unmatchedRequirements)&&(identical(other.status, status) || other.status == status)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.consentGivenAt, consentGivenAt) || other.consentGivenAt == consentGivenAt)&&(identical(other.finalSections, finalSections) || other.finalSections == finalSections)&&const DeepCollectionEquality().equals(other._acceptedBulletIds, _acceptedBulletIds)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resumeId,jobDescriptionId,originalSections,tailoredSections,const DeepCollectionEquality().hash(_perBulletDiffs),atsScoreBefore,atsScoreAfter,const DeepCollectionEquality().hash(_unmatchedRequirements),status,failureReason,consentGivenAt,finalSections,const DeepCollectionEquality().hash(_acceptedBulletIds),acceptedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TailoringResult(id: $id, resumeId: $resumeId, jobDescriptionId: $jobDescriptionId, originalSections: $originalSections, tailoredSections: $tailoredSections, perBulletDiffs: $perBulletDiffs, atsScoreBefore: $atsScoreBefore, atsScoreAfter: $atsScoreAfter, unmatchedRequirements: $unmatchedRequirements, status: $status, failureReason: $failureReason, consentGivenAt: $consentGivenAt, finalSections: $finalSections, acceptedBulletIds: $acceptedBulletIds, acceptedAt: $acceptedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TailoringResultCopyWith<$Res> implements $TailoringResultCopyWith<$Res> {
  factory _$TailoringResultCopyWith(_TailoringResult value, $Res Function(_TailoringResult) _then) = __$TailoringResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String resumeId, String jobDescriptionId, ResumeSections originalSections, ResumeSections? tailoredSections, List<BulletDiff> perBulletDiffs, double atsScoreBefore, double? atsScoreAfter, List<String> unmatchedRequirements, TailoringStatus status, String? failureReason, DateTime consentGivenAt, ResumeSections? finalSections, List<String> acceptedBulletIds, DateTime? acceptedAt, DateTime createdAt, DateTime updatedAt
});


@override $ResumeSectionsCopyWith<$Res> get originalSections;@override $ResumeSectionsCopyWith<$Res>? get tailoredSections;@override $ResumeSectionsCopyWith<$Res>? get finalSections;

}
/// @nodoc
class __$TailoringResultCopyWithImpl<$Res>
    implements _$TailoringResultCopyWith<$Res> {
  __$TailoringResultCopyWithImpl(this._self, this._then);

  final _TailoringResult _self;
  final $Res Function(_TailoringResult) _then;

/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resumeId = null,Object? jobDescriptionId = null,Object? originalSections = null,Object? tailoredSections = freezed,Object? perBulletDiffs = null,Object? atsScoreBefore = null,Object? atsScoreAfter = freezed,Object? unmatchedRequirements = null,Object? status = null,Object? failureReason = freezed,Object? consentGivenAt = null,Object? finalSections = freezed,Object? acceptedBulletIds = null,Object? acceptedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TailoringResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resumeId: null == resumeId ? _self.resumeId : resumeId // ignore: cast_nullable_to_non_nullable
as String,jobDescriptionId: null == jobDescriptionId ? _self.jobDescriptionId : jobDescriptionId // ignore: cast_nullable_to_non_nullable
as String,originalSections: null == originalSections ? _self.originalSections : originalSections // ignore: cast_nullable_to_non_nullable
as ResumeSections,tailoredSections: freezed == tailoredSections ? _self.tailoredSections : tailoredSections // ignore: cast_nullable_to_non_nullable
as ResumeSections?,perBulletDiffs: null == perBulletDiffs ? _self._perBulletDiffs : perBulletDiffs // ignore: cast_nullable_to_non_nullable
as List<BulletDiff>,atsScoreBefore: null == atsScoreBefore ? _self.atsScoreBefore : atsScoreBefore // ignore: cast_nullable_to_non_nullable
as double,atsScoreAfter: freezed == atsScoreAfter ? _self.atsScoreAfter : atsScoreAfter // ignore: cast_nullable_to_non_nullable
as double?,unmatchedRequirements: null == unmatchedRequirements ? _self._unmatchedRequirements : unmatchedRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TailoringStatus,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,consentGivenAt: null == consentGivenAt ? _self.consentGivenAt : consentGivenAt // ignore: cast_nullable_to_non_nullable
as DateTime,finalSections: freezed == finalSections ? _self.finalSections : finalSections // ignore: cast_nullable_to_non_nullable
as ResumeSections?,acceptedBulletIds: null == acceptedBulletIds ? _self._acceptedBulletIds : acceptedBulletIds // ignore: cast_nullable_to_non_nullable
as List<String>,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res> get originalSections {
  
  return $ResumeSectionsCopyWith<$Res>(_self.originalSections, (value) {
    return _then(_self.copyWith(originalSections: value));
  });
}/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res>? get tailoredSections {
    if (_self.tailoredSections == null) {
    return null;
  }

  return $ResumeSectionsCopyWith<$Res>(_self.tailoredSections!, (value) {
    return _then(_self.copyWith(tailoredSections: value));
  });
}/// Create a copy of TailoringResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<$Res>? get finalSections {
    if (_self.finalSections == null) {
    return null;
  }

  return $ResumeSectionsCopyWith<$Res>(_self.finalSections!, (value) {
    return _then(_self.copyWith(finalSections: value));
  });
}
}

// dart format on
