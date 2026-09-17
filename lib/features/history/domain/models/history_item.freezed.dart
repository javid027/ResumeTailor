// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryItemResume {

 String get id; String? get name;
/// Create a copy of HistoryItemResume
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemResumeCopyWith<HistoryItemResume> get copyWith => _$HistoryItemResumeCopyWithImpl<HistoryItemResume>(this as HistoryItemResume, _$identity);

  /// Serializes this HistoryItemResume to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItemResume&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HistoryItemResume(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $HistoryItemResumeCopyWith<$Res>  {
  factory $HistoryItemResumeCopyWith(HistoryItemResume value, $Res Function(HistoryItemResume) _then) = _$HistoryItemResumeCopyWithImpl;
@useResult
$Res call({
 String id, String? name
});




}
/// @nodoc
class _$HistoryItemResumeCopyWithImpl<$Res>
    implements $HistoryItemResumeCopyWith<$Res> {
  _$HistoryItemResumeCopyWithImpl(this._self, this._then);

  final HistoryItemResume _self;
  final $Res Function(HistoryItemResume) _then;

/// Create a copy of HistoryItemResume
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItemResume].
extension HistoryItemResumePatterns on HistoryItemResume {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItemResume value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItemResume() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItemResume value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItemResume():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItemResume value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItemResume() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItemResume() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _HistoryItemResume():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItemResume() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItemResume implements HistoryItemResume {
  const _HistoryItemResume({required this.id, this.name});
  factory _HistoryItemResume.fromJson(Map<String, dynamic> json) => _$HistoryItemResumeFromJson(json);

@override final  String id;
@override final  String? name;

/// Create a copy of HistoryItemResume
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemResumeCopyWith<_HistoryItemResume> get copyWith => __$HistoryItemResumeCopyWithImpl<_HistoryItemResume>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemResumeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItemResume&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HistoryItemResume(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemResumeCopyWith<$Res> implements $HistoryItemResumeCopyWith<$Res> {
  factory _$HistoryItemResumeCopyWith(_HistoryItemResume value, $Res Function(_HistoryItemResume) _then) = __$HistoryItemResumeCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name
});




}
/// @nodoc
class __$HistoryItemResumeCopyWithImpl<$Res>
    implements _$HistoryItemResumeCopyWith<$Res> {
  __$HistoryItemResumeCopyWithImpl(this._self, this._then);

  final _HistoryItemResume _self;
  final $Res Function(_HistoryItemResume) _then;

/// Create a copy of HistoryItemResume
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,}) {
  return _then(_HistoryItemResume(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HistoryItemJobDescription {

 String get id; String get excerpt; List<String>? get keywords;
/// Create a copy of HistoryItemJobDescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemJobDescriptionCopyWith<HistoryItemJobDescription> get copyWith => _$HistoryItemJobDescriptionCopyWithImpl<HistoryItemJobDescription>(this as HistoryItemJobDescription, _$identity);

  /// Serializes this HistoryItemJobDescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItemJobDescription&&(identical(other.id, id) || other.id == id)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&const DeepCollectionEquality().equals(other.keywords, keywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,excerpt,const DeepCollectionEquality().hash(keywords));

@override
String toString() {
  return 'HistoryItemJobDescription(id: $id, excerpt: $excerpt, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class $HistoryItemJobDescriptionCopyWith<$Res>  {
  factory $HistoryItemJobDescriptionCopyWith(HistoryItemJobDescription value, $Res Function(HistoryItemJobDescription) _then) = _$HistoryItemJobDescriptionCopyWithImpl;
@useResult
$Res call({
 String id, String excerpt, List<String>? keywords
});




}
/// @nodoc
class _$HistoryItemJobDescriptionCopyWithImpl<$Res>
    implements $HistoryItemJobDescriptionCopyWith<$Res> {
  _$HistoryItemJobDescriptionCopyWithImpl(this._self, this._then);

  final HistoryItemJobDescription _self;
  final $Res Function(HistoryItemJobDescription) _then;

/// Create a copy of HistoryItemJobDescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? excerpt = null,Object? keywords = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItemJobDescription].
extension HistoryItemJobDescriptionPatterns on HistoryItemJobDescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItemJobDescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItemJobDescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItemJobDescription value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItemJobDescription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItemJobDescription value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItemJobDescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String excerpt,  List<String>? keywords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItemJobDescription() when $default != null:
return $default(_that.id,_that.excerpt,_that.keywords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String excerpt,  List<String>? keywords)  $default,) {final _that = this;
switch (_that) {
case _HistoryItemJobDescription():
return $default(_that.id,_that.excerpt,_that.keywords);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String excerpt,  List<String>? keywords)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItemJobDescription() when $default != null:
return $default(_that.id,_that.excerpt,_that.keywords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItemJobDescription implements HistoryItemJobDescription {
  const _HistoryItemJobDescription({required this.id, required this.excerpt, final  List<String>? keywords}): _keywords = keywords;
  factory _HistoryItemJobDescription.fromJson(Map<String, dynamic> json) => _$HistoryItemJobDescriptionFromJson(json);

@override final  String id;
@override final  String excerpt;
 final  List<String>? _keywords;
@override List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HistoryItemJobDescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemJobDescriptionCopyWith<_HistoryItemJobDescription> get copyWith => __$HistoryItemJobDescriptionCopyWithImpl<_HistoryItemJobDescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemJobDescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItemJobDescription&&(identical(other.id, id) || other.id == id)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&const DeepCollectionEquality().equals(other._keywords, _keywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,excerpt,const DeepCollectionEquality().hash(_keywords));

@override
String toString() {
  return 'HistoryItemJobDescription(id: $id, excerpt: $excerpt, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemJobDescriptionCopyWith<$Res> implements $HistoryItemJobDescriptionCopyWith<$Res> {
  factory _$HistoryItemJobDescriptionCopyWith(_HistoryItemJobDescription value, $Res Function(_HistoryItemJobDescription) _then) = __$HistoryItemJobDescriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String excerpt, List<String>? keywords
});




}
/// @nodoc
class __$HistoryItemJobDescriptionCopyWithImpl<$Res>
    implements _$HistoryItemJobDescriptionCopyWith<$Res> {
  __$HistoryItemJobDescriptionCopyWithImpl(this._self, this._then);

  final _HistoryItemJobDescription _self;
  final $Res Function(_HistoryItemJobDescription) _then;

/// Create a copy of HistoryItemJobDescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? excerpt = null,Object? keywords = freezed,}) {
  return _then(_HistoryItemJobDescription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$HistoryItem {

 String get id; TailoringStatus get status; double get atsScoreBefore; double? get atsScoreAfter; List<String> get unmatchedRequirements; DateTime get createdAt; DateTime? get acceptedAt; HistoryItemResume get resume; HistoryItemJobDescription get jobDescription;
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemCopyWith<HistoryItem> get copyWith => _$HistoryItemCopyWithImpl<HistoryItem>(this as HistoryItem, _$identity);

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.atsScoreBefore, atsScoreBefore) || other.atsScoreBefore == atsScoreBefore)&&(identical(other.atsScoreAfter, atsScoreAfter) || other.atsScoreAfter == atsScoreAfter)&&const DeepCollectionEquality().equals(other.unmatchedRequirements, unmatchedRequirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.jobDescription, jobDescription) || other.jobDescription == jobDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,atsScoreBefore,atsScoreAfter,const DeepCollectionEquality().hash(unmatchedRequirements),createdAt,acceptedAt,resume,jobDescription);

@override
String toString() {
  return 'HistoryItem(id: $id, status: $status, atsScoreBefore: $atsScoreBefore, atsScoreAfter: $atsScoreAfter, unmatchedRequirements: $unmatchedRequirements, createdAt: $createdAt, acceptedAt: $acceptedAt, resume: $resume, jobDescription: $jobDescription)';
}


}

/// @nodoc
abstract mixin class $HistoryItemCopyWith<$Res>  {
  factory $HistoryItemCopyWith(HistoryItem value, $Res Function(HistoryItem) _then) = _$HistoryItemCopyWithImpl;
@useResult
$Res call({
 String id, TailoringStatus status, double atsScoreBefore, double? atsScoreAfter, List<String> unmatchedRequirements, DateTime createdAt, DateTime? acceptedAt, HistoryItemResume resume, HistoryItemJobDescription jobDescription
});


$HistoryItemResumeCopyWith<$Res> get resume;$HistoryItemJobDescriptionCopyWith<$Res> get jobDescription;

}
/// @nodoc
class _$HistoryItemCopyWithImpl<$Res>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._self, this._then);

  final HistoryItem _self;
  final $Res Function(HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? atsScoreBefore = null,Object? atsScoreAfter = freezed,Object? unmatchedRequirements = null,Object? createdAt = null,Object? acceptedAt = freezed,Object? resume = null,Object? jobDescription = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TailoringStatus,atsScoreBefore: null == atsScoreBefore ? _self.atsScoreBefore : atsScoreBefore // ignore: cast_nullable_to_non_nullable
as double,atsScoreAfter: freezed == atsScoreAfter ? _self.atsScoreAfter : atsScoreAfter // ignore: cast_nullable_to_non_nullable
as double?,unmatchedRequirements: null == unmatchedRequirements ? _self.unmatchedRequirements : unmatchedRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as HistoryItemResume,jobDescription: null == jobDescription ? _self.jobDescription : jobDescription // ignore: cast_nullable_to_non_nullable
as HistoryItemJobDescription,
  ));
}
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryItemResumeCopyWith<$Res> get resume {
  
  return $HistoryItemResumeCopyWith<$Res>(_self.resume, (value) {
    return _then(_self.copyWith(resume: value));
  });
}/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryItemJobDescriptionCopyWith<$Res> get jobDescription {
  
  return $HistoryItemJobDescriptionCopyWith<$Res>(_self.jobDescription, (value) {
    return _then(_self.copyWith(jobDescription: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryItem].
extension HistoryItemPatterns on HistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TailoringStatus status,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  DateTime createdAt,  DateTime? acceptedAt,  HistoryItemResume resume,  HistoryItemJobDescription jobDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.status,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.createdAt,_that.acceptedAt,_that.resume,_that.jobDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TailoringStatus status,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  DateTime createdAt,  DateTime? acceptedAt,  HistoryItemResume resume,  HistoryItemJobDescription jobDescription)  $default,) {final _that = this;
switch (_that) {
case _HistoryItem():
return $default(_that.id,_that.status,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.createdAt,_that.acceptedAt,_that.resume,_that.jobDescription);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TailoringStatus status,  double atsScoreBefore,  double? atsScoreAfter,  List<String> unmatchedRequirements,  DateTime createdAt,  DateTime? acceptedAt,  HistoryItemResume resume,  HistoryItemJobDescription jobDescription)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.status,_that.atsScoreBefore,_that.atsScoreAfter,_that.unmatchedRequirements,_that.createdAt,_that.acceptedAt,_that.resume,_that.jobDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItem implements HistoryItem {
  const _HistoryItem({required this.id, required this.status, required this.atsScoreBefore, this.atsScoreAfter, required final  List<String> unmatchedRequirements, required this.createdAt, this.acceptedAt, required this.resume, required this.jobDescription}): _unmatchedRequirements = unmatchedRequirements;
  factory _HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

@override final  String id;
@override final  TailoringStatus status;
@override final  double atsScoreBefore;
@override final  double? atsScoreAfter;
 final  List<String> _unmatchedRequirements;
@override List<String> get unmatchedRequirements {
  if (_unmatchedRequirements is EqualUnmodifiableListView) return _unmatchedRequirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unmatchedRequirements);
}

@override final  DateTime createdAt;
@override final  DateTime? acceptedAt;
@override final  HistoryItemResume resume;
@override final  HistoryItemJobDescription jobDescription;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemCopyWith<_HistoryItem> get copyWith => __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.atsScoreBefore, atsScoreBefore) || other.atsScoreBefore == atsScoreBefore)&&(identical(other.atsScoreAfter, atsScoreAfter) || other.atsScoreAfter == atsScoreAfter)&&const DeepCollectionEquality().equals(other._unmatchedRequirements, _unmatchedRequirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.jobDescription, jobDescription) || other.jobDescription == jobDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,atsScoreBefore,atsScoreAfter,const DeepCollectionEquality().hash(_unmatchedRequirements),createdAt,acceptedAt,resume,jobDescription);

@override
String toString() {
  return 'HistoryItem(id: $id, status: $status, atsScoreBefore: $atsScoreBefore, atsScoreAfter: $atsScoreAfter, unmatchedRequirements: $unmatchedRequirements, createdAt: $createdAt, acceptedAt: $acceptedAt, resume: $resume, jobDescription: $jobDescription)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemCopyWith<$Res> implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(_HistoryItem value, $Res Function(_HistoryItem) _then) = __$HistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, TailoringStatus status, double atsScoreBefore, double? atsScoreAfter, List<String> unmatchedRequirements, DateTime createdAt, DateTime? acceptedAt, HistoryItemResume resume, HistoryItemJobDescription jobDescription
});


@override $HistoryItemResumeCopyWith<$Res> get resume;@override $HistoryItemJobDescriptionCopyWith<$Res> get jobDescription;

}
/// @nodoc
class __$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(this._self, this._then);

  final _HistoryItem _self;
  final $Res Function(_HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? atsScoreBefore = null,Object? atsScoreAfter = freezed,Object? unmatchedRequirements = null,Object? createdAt = null,Object? acceptedAt = freezed,Object? resume = null,Object? jobDescription = null,}) {
  return _then(_HistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TailoringStatus,atsScoreBefore: null == atsScoreBefore ? _self.atsScoreBefore : atsScoreBefore // ignore: cast_nullable_to_non_nullable
as double,atsScoreAfter: freezed == atsScoreAfter ? _self.atsScoreAfter : atsScoreAfter // ignore: cast_nullable_to_non_nullable
as double?,unmatchedRequirements: null == unmatchedRequirements ? _self._unmatchedRequirements : unmatchedRequirements // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as HistoryItemResume,jobDescription: null == jobDescription ? _self.jobDescription : jobDescription // ignore: cast_nullable_to_non_nullable
as HistoryItemJobDescription,
  ));
}

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryItemResumeCopyWith<$Res> get resume {
  
  return $HistoryItemResumeCopyWith<$Res>(_self.resume, (value) {
    return _then(_self.copyWith(resume: value));
  });
}/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryItemJobDescriptionCopyWith<$Res> get jobDescription {
  
  return $HistoryItemJobDescriptionCopyWith<$Res>(_self.jobDescription, (value) {
    return _then(_self.copyWith(jobDescription: value));
  });
}
}

// dart format on
