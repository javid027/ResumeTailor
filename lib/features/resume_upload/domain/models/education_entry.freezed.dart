// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EducationEntry {

 String? get institution; String? get degree; String? get startDate; String? get endDate;
/// Create a copy of EducationEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationEntryCopyWith<EducationEntry> get copyWith => _$EducationEntryCopyWithImpl<EducationEntry>(this as EducationEntry, _$identity);

  /// Serializes this EducationEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EducationEntry&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution,degree,startDate,endDate);

@override
String toString() {
  return 'EducationEntry(institution: $institution, degree: $degree, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $EducationEntryCopyWith<$Res>  {
  factory $EducationEntryCopyWith(EducationEntry value, $Res Function(EducationEntry) _then) = _$EducationEntryCopyWithImpl;
@useResult
$Res call({
 String? institution, String? degree, String? startDate, String? endDate
});




}
/// @nodoc
class _$EducationEntryCopyWithImpl<$Res>
    implements $EducationEntryCopyWith<$Res> {
  _$EducationEntryCopyWithImpl(this._self, this._then);

  final EducationEntry _self;
  final $Res Function(EducationEntry) _then;

/// Create a copy of EducationEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? institution = freezed,Object? degree = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EducationEntry].
extension EducationEntryPatterns on EducationEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EducationEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EducationEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EducationEntry value)  $default,){
final _that = this;
switch (_that) {
case _EducationEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EducationEntry value)?  $default,){
final _that = this;
switch (_that) {
case _EducationEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? institution,  String? degree,  String? startDate,  String? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EducationEntry() when $default != null:
return $default(_that.institution,_that.degree,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? institution,  String? degree,  String? startDate,  String? endDate)  $default,) {final _that = this;
switch (_that) {
case _EducationEntry():
return $default(_that.institution,_that.degree,_that.startDate,_that.endDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? institution,  String? degree,  String? startDate,  String? endDate)?  $default,) {final _that = this;
switch (_that) {
case _EducationEntry() when $default != null:
return $default(_that.institution,_that.degree,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EducationEntry implements EducationEntry {
  const _EducationEntry({this.institution, this.degree, this.startDate, this.endDate});
  factory _EducationEntry.fromJson(Map<String, dynamic> json) => _$EducationEntryFromJson(json);

@override final  String? institution;
@override final  String? degree;
@override final  String? startDate;
@override final  String? endDate;

/// Create a copy of EducationEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationEntryCopyWith<_EducationEntry> get copyWith => __$EducationEntryCopyWithImpl<_EducationEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EducationEntry&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution,degree,startDate,endDate);

@override
String toString() {
  return 'EducationEntry(institution: $institution, degree: $degree, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$EducationEntryCopyWith<$Res> implements $EducationEntryCopyWith<$Res> {
  factory _$EducationEntryCopyWith(_EducationEntry value, $Res Function(_EducationEntry) _then) = __$EducationEntryCopyWithImpl;
@override @useResult
$Res call({
 String? institution, String? degree, String? startDate, String? endDate
});




}
/// @nodoc
class __$EducationEntryCopyWithImpl<$Res>
    implements _$EducationEntryCopyWith<$Res> {
  __$EducationEntryCopyWithImpl(this._self, this._then);

  final _EducationEntry _self;
  final $Res Function(_EducationEntry) _then;

/// Create a copy of EducationEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? institution = freezed,Object? degree = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_EducationEntry(
institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
