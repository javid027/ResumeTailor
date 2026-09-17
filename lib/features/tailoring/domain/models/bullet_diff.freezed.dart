// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bullet_diff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulletDiff {

 String get sectionId; String get bulletId; String get original; String get suggested; BulletDiffStatus get status;
/// Create a copy of BulletDiff
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulletDiffCopyWith<BulletDiff> get copyWith => _$BulletDiffCopyWithImpl<BulletDiff>(this as BulletDiff, _$identity);

  /// Serializes this BulletDiff to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulletDiff&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.bulletId, bulletId) || other.bulletId == bulletId)&&(identical(other.original, original) || other.original == original)&&(identical(other.suggested, suggested) || other.suggested == suggested)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sectionId,bulletId,original,suggested,status);

@override
String toString() {
  return 'BulletDiff(sectionId: $sectionId, bulletId: $bulletId, original: $original, suggested: $suggested, status: $status)';
}


}

/// @nodoc
abstract mixin class $BulletDiffCopyWith<$Res>  {
  factory $BulletDiffCopyWith(BulletDiff value, $Res Function(BulletDiff) _then) = _$BulletDiffCopyWithImpl;
@useResult
$Res call({
 String sectionId, String bulletId, String original, String suggested, BulletDiffStatus status
});




}
/// @nodoc
class _$BulletDiffCopyWithImpl<$Res>
    implements $BulletDiffCopyWith<$Res> {
  _$BulletDiffCopyWithImpl(this._self, this._then);

  final BulletDiff _self;
  final $Res Function(BulletDiff) _then;

/// Create a copy of BulletDiff
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sectionId = null,Object? bulletId = null,Object? original = null,Object? suggested = null,Object? status = null,}) {
  return _then(_self.copyWith(
sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,bulletId: null == bulletId ? _self.bulletId : bulletId // ignore: cast_nullable_to_non_nullable
as String,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as String,suggested: null == suggested ? _self.suggested : suggested // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BulletDiffStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [BulletDiff].
extension BulletDiffPatterns on BulletDiff {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulletDiff value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulletDiff() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulletDiff value)  $default,){
final _that = this;
switch (_that) {
case _BulletDiff():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulletDiff value)?  $default,){
final _that = this;
switch (_that) {
case _BulletDiff() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sectionId,  String bulletId,  String original,  String suggested,  BulletDiffStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulletDiff() when $default != null:
return $default(_that.sectionId,_that.bulletId,_that.original,_that.suggested,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sectionId,  String bulletId,  String original,  String suggested,  BulletDiffStatus status)  $default,) {final _that = this;
switch (_that) {
case _BulletDiff():
return $default(_that.sectionId,_that.bulletId,_that.original,_that.suggested,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sectionId,  String bulletId,  String original,  String suggested,  BulletDiffStatus status)?  $default,) {final _that = this;
switch (_that) {
case _BulletDiff() when $default != null:
return $default(_that.sectionId,_that.bulletId,_that.original,_that.suggested,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BulletDiff implements BulletDiff {
  const _BulletDiff({required this.sectionId, required this.bulletId, required this.original, required this.suggested, required this.status});
  factory _BulletDiff.fromJson(Map<String, dynamic> json) => _$BulletDiffFromJson(json);

@override final  String sectionId;
@override final  String bulletId;
@override final  String original;
@override final  String suggested;
@override final  BulletDiffStatus status;

/// Create a copy of BulletDiff
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulletDiffCopyWith<_BulletDiff> get copyWith => __$BulletDiffCopyWithImpl<_BulletDiff>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BulletDiffToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulletDiff&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.bulletId, bulletId) || other.bulletId == bulletId)&&(identical(other.original, original) || other.original == original)&&(identical(other.suggested, suggested) || other.suggested == suggested)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sectionId,bulletId,original,suggested,status);

@override
String toString() {
  return 'BulletDiff(sectionId: $sectionId, bulletId: $bulletId, original: $original, suggested: $suggested, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BulletDiffCopyWith<$Res> implements $BulletDiffCopyWith<$Res> {
  factory _$BulletDiffCopyWith(_BulletDiff value, $Res Function(_BulletDiff) _then) = __$BulletDiffCopyWithImpl;
@override @useResult
$Res call({
 String sectionId, String bulletId, String original, String suggested, BulletDiffStatus status
});




}
/// @nodoc
class __$BulletDiffCopyWithImpl<$Res>
    implements _$BulletDiffCopyWith<$Res> {
  __$BulletDiffCopyWithImpl(this._self, this._then);

  final _BulletDiff _self;
  final $Res Function(_BulletDiff) _then;

/// Create a copy of BulletDiff
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sectionId = null,Object? bulletId = null,Object? original = null,Object? suggested = null,Object? status = null,}) {
  return _then(_BulletDiff(
sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,bulletId: null == bulletId ? _self.bulletId : bulletId // ignore: cast_nullable_to_non_nullable
as String,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as String,suggested: null == suggested ? _self.suggested : suggested // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BulletDiffStatus,
  ));
}


}

// dart format on
