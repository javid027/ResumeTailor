// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExperienceEntry {

 String? get company; String? get title; String? get startDate; String? get endDate; List<String> get bullets;
/// Create a copy of ExperienceEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceEntryCopyWith<ExperienceEntry> get copyWith => _$ExperienceEntryCopyWithImpl<ExperienceEntry>(this as ExperienceEntry, _$identity);

  /// Serializes this ExperienceEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExperienceEntry&&(identical(other.company, company) || other.company == company)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.bullets, bullets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,title,startDate,endDate,const DeepCollectionEquality().hash(bullets));

@override
String toString() {
  return 'ExperienceEntry(company: $company, title: $title, startDate: $startDate, endDate: $endDate, bullets: $bullets)';
}


}

/// @nodoc
abstract mixin class $ExperienceEntryCopyWith<$Res>  {
  factory $ExperienceEntryCopyWith(ExperienceEntry value, $Res Function(ExperienceEntry) _then) = _$ExperienceEntryCopyWithImpl;
@useResult
$Res call({
 String? company, String? title, String? startDate, String? endDate, List<String> bullets
});




}
/// @nodoc
class _$ExperienceEntryCopyWithImpl<$Res>
    implements $ExperienceEntryCopyWith<$Res> {
  _$ExperienceEntryCopyWithImpl(this._self, this._then);

  final ExperienceEntry _self;
  final $Res Function(ExperienceEntry) _then;

/// Create a copy of ExperienceEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? company = freezed,Object? title = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? bullets = null,}) {
  return _then(_self.copyWith(
company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,bullets: null == bullets ? _self.bullets : bullets // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExperienceEntry].
extension ExperienceEntryPatterns on ExperienceEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExperienceEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExperienceEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExperienceEntry value)  $default,){
final _that = this;
switch (_that) {
case _ExperienceEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExperienceEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ExperienceEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? company,  String? title,  String? startDate,  String? endDate,  List<String> bullets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExperienceEntry() when $default != null:
return $default(_that.company,_that.title,_that.startDate,_that.endDate,_that.bullets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? company,  String? title,  String? startDate,  String? endDate,  List<String> bullets)  $default,) {final _that = this;
switch (_that) {
case _ExperienceEntry():
return $default(_that.company,_that.title,_that.startDate,_that.endDate,_that.bullets);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? company,  String? title,  String? startDate,  String? endDate,  List<String> bullets)?  $default,) {final _that = this;
switch (_that) {
case _ExperienceEntry() when $default != null:
return $default(_that.company,_that.title,_that.startDate,_that.endDate,_that.bullets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExperienceEntry implements ExperienceEntry {
  const _ExperienceEntry({this.company, this.title, this.startDate, this.endDate, required final  List<String> bullets}): _bullets = bullets;
  factory _ExperienceEntry.fromJson(Map<String, dynamic> json) => _$ExperienceEntryFromJson(json);

@override final  String? company;
@override final  String? title;
@override final  String? startDate;
@override final  String? endDate;
 final  List<String> _bullets;
@override List<String> get bullets {
  if (_bullets is EqualUnmodifiableListView) return _bullets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bullets);
}


/// Create a copy of ExperienceEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceEntryCopyWith<_ExperienceEntry> get copyWith => __$ExperienceEntryCopyWithImpl<_ExperienceEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExperienceEntry&&(identical(other.company, company) || other.company == company)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._bullets, _bullets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,title,startDate,endDate,const DeepCollectionEquality().hash(_bullets));

@override
String toString() {
  return 'ExperienceEntry(company: $company, title: $title, startDate: $startDate, endDate: $endDate, bullets: $bullets)';
}


}

/// @nodoc
abstract mixin class _$ExperienceEntryCopyWith<$Res> implements $ExperienceEntryCopyWith<$Res> {
  factory _$ExperienceEntryCopyWith(_ExperienceEntry value, $Res Function(_ExperienceEntry) _then) = __$ExperienceEntryCopyWithImpl;
@override @useResult
$Res call({
 String? company, String? title, String? startDate, String? endDate, List<String> bullets
});




}
/// @nodoc
class __$ExperienceEntryCopyWithImpl<$Res>
    implements _$ExperienceEntryCopyWith<$Res> {
  __$ExperienceEntryCopyWithImpl(this._self, this._then);

  final _ExperienceEntry _self;
  final $Res Function(_ExperienceEntry) _then;

/// Create a copy of ExperienceEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? company = freezed,Object? title = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? bullets = null,}) {
  return _then(_ExperienceEntry(
company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,bullets: null == bullets ? _self._bullets : bullets // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
