// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_description.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobDescription {

 String get id; String get userId; String get rawText; DateTime get createdAt; DateTime get updatedAt; List<String>? get keywords; List<String>? get requirements;
/// Create a copy of JobDescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDescriptionCopyWith<JobDescription> get copyWith => _$JobDescriptionCopyWithImpl<JobDescription>(this as JobDescription, _$identity);

  /// Serializes this JobDescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescription&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.requirements, requirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rawText,createdAt,updatedAt,const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(requirements));

@override
String toString() {
  return 'JobDescription(id: $id, userId: $userId, rawText: $rawText, createdAt: $createdAt, updatedAt: $updatedAt, keywords: $keywords, requirements: $requirements)';
}


}

/// @nodoc
abstract mixin class $JobDescriptionCopyWith<$Res>  {
  factory $JobDescriptionCopyWith(JobDescription value, $Res Function(JobDescription) _then) = _$JobDescriptionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String rawText, DateTime createdAt, DateTime updatedAt, List<String>? keywords, List<String>? requirements
});




}
/// @nodoc
class _$JobDescriptionCopyWithImpl<$Res>
    implements $JobDescriptionCopyWith<$Res> {
  _$JobDescriptionCopyWithImpl(this._self, this._then);

  final JobDescription _self;
  final $Res Function(JobDescription) _then;

/// Create a copy of JobDescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? rawText = null,Object? createdAt = null,Object? updatedAt = null,Object? keywords = freezed,Object? requirements = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobDescription].
extension JobDescriptionPatterns on JobDescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDescription value)  $default,){
final _that = this;
switch (_that) {
case _JobDescription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDescription value)?  $default,){
final _that = this;
switch (_that) {
case _JobDescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String rawText,  DateTime createdAt,  DateTime updatedAt,  List<String>? keywords,  List<String>? requirements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDescription() when $default != null:
return $default(_that.id,_that.userId,_that.rawText,_that.createdAt,_that.updatedAt,_that.keywords,_that.requirements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String rawText,  DateTime createdAt,  DateTime updatedAt,  List<String>? keywords,  List<String>? requirements)  $default,) {final _that = this;
switch (_that) {
case _JobDescription():
return $default(_that.id,_that.userId,_that.rawText,_that.createdAt,_that.updatedAt,_that.keywords,_that.requirements);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String rawText,  DateTime createdAt,  DateTime updatedAt,  List<String>? keywords,  List<String>? requirements)?  $default,) {final _that = this;
switch (_that) {
case _JobDescription() when $default != null:
return $default(_that.id,_that.userId,_that.rawText,_that.createdAt,_that.updatedAt,_that.keywords,_that.requirements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobDescription implements JobDescription {
  const _JobDescription({required this.id, required this.userId, required this.rawText, required this.createdAt, required this.updatedAt, final  List<String>? keywords, final  List<String>? requirements}): _keywords = keywords,_requirements = requirements;
  factory _JobDescription.fromJson(Map<String, dynamic> json) => _$JobDescriptionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String rawText;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<String>? _keywords;
@override List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _requirements;
@override List<String>? get requirements {
  final value = _requirements;
  if (value == null) return null;
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of JobDescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDescriptionCopyWith<_JobDescription> get copyWith => __$JobDescriptionCopyWithImpl<_JobDescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobDescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDescription&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other._requirements, _requirements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rawText,createdAt,updatedAt,const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(_requirements));

@override
String toString() {
  return 'JobDescription(id: $id, userId: $userId, rawText: $rawText, createdAt: $createdAt, updatedAt: $updatedAt, keywords: $keywords, requirements: $requirements)';
}


}

/// @nodoc
abstract mixin class _$JobDescriptionCopyWith<$Res> implements $JobDescriptionCopyWith<$Res> {
  factory _$JobDescriptionCopyWith(_JobDescription value, $Res Function(_JobDescription) _then) = __$JobDescriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String rawText, DateTime createdAt, DateTime updatedAt, List<String>? keywords, List<String>? requirements
});




}
/// @nodoc
class __$JobDescriptionCopyWithImpl<$Res>
    implements _$JobDescriptionCopyWith<$Res> {
  __$JobDescriptionCopyWithImpl(this._self, this._then);

  final _JobDescription _self;
  final $Res Function(_JobDescription) _then;

/// Create a copy of JobDescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? rawText = null,Object? createdAt = null,Object? updatedAt = null,Object? keywords = freezed,Object? requirements = freezed,}) {
  return _then(_JobDescription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,requirements: freezed == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
