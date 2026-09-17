// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Resume {

 String get id; String get userId; String get rawFileUrl; DateTime get createdAt; DateTime get updatedAt; ParsedContact? get parsedContact; String? get summary; List<ExperienceEntry>? get experience; List<EducationEntry>? get education; List<String>? get skills;
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeCopyWith<Resume> get copyWith => _$ResumeCopyWithImpl<Resume>(this as Resume, _$identity);

  /// Serializes this Resume to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resume&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rawFileUrl, rawFileUrl) || other.rawFileUrl == rawFileUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parsedContact, parsedContact) || other.parsedContact == parsedContact)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.experience, experience)&&const DeepCollectionEquality().equals(other.education, education)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rawFileUrl,createdAt,updatedAt,parsedContact,summary,const DeepCollectionEquality().hash(experience),const DeepCollectionEquality().hash(education),const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'Resume(id: $id, userId: $userId, rawFileUrl: $rawFileUrl, createdAt: $createdAt, updatedAt: $updatedAt, parsedContact: $parsedContact, summary: $summary, experience: $experience, education: $education, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $ResumeCopyWith<$Res>  {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) _then) = _$ResumeCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String rawFileUrl, DateTime createdAt, DateTime updatedAt, ParsedContact? parsedContact, String? summary, List<ExperienceEntry>? experience, List<EducationEntry>? education, List<String>? skills
});


$ParsedContactCopyWith<$Res>? get parsedContact;

}
/// @nodoc
class _$ResumeCopyWithImpl<$Res>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(this._self, this._then);

  final Resume _self;
  final $Res Function(Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? rawFileUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? parsedContact = freezed,Object? summary = freezed,Object? experience = freezed,Object? education = freezed,Object? skills = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rawFileUrl: null == rawFileUrl ? _self.rawFileUrl : rawFileUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parsedContact: freezed == parsedContact ? _self.parsedContact : parsedContact // ignore: cast_nullable_to_non_nullable
as ParsedContact?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as List<ExperienceEntry>?,education: freezed == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedContactCopyWith<$Res>? get parsedContact {
    if (_self.parsedContact == null) {
    return null;
  }

  return $ParsedContactCopyWith<$Res>(_self.parsedContact!, (value) {
    return _then(_self.copyWith(parsedContact: value));
  });
}
}


/// Adds pattern-matching-related methods to [Resume].
extension ResumePatterns on Resume {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resume value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resume value)  $default,){
final _that = this;
switch (_that) {
case _Resume():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resume value)?  $default,){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String rawFileUrl,  DateTime createdAt,  DateTime updatedAt,  ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.userId,_that.rawFileUrl,_that.createdAt,_that.updatedAt,_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String rawFileUrl,  DateTime createdAt,  DateTime updatedAt,  ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)  $default,) {final _that = this;
switch (_that) {
case _Resume():
return $default(_that.id,_that.userId,_that.rawFileUrl,_that.createdAt,_that.updatedAt,_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String rawFileUrl,  DateTime createdAt,  DateTime updatedAt,  ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)?  $default,) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.userId,_that.rawFileUrl,_that.createdAt,_that.updatedAt,_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resume implements Resume {
  const _Resume({required this.id, required this.userId, required this.rawFileUrl, required this.createdAt, required this.updatedAt, this.parsedContact, this.summary, final  List<ExperienceEntry>? experience, final  List<EducationEntry>? education, final  List<String>? skills}): _experience = experience,_education = education,_skills = skills;
  factory _Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String rawFileUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  ParsedContact? parsedContact;
@override final  String? summary;
 final  List<ExperienceEntry>? _experience;
@override List<ExperienceEntry>? get experience {
  final value = _experience;
  if (value == null) return null;
  if (_experience is EqualUnmodifiableListView) return _experience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<EducationEntry>? _education;
@override List<EducationEntry>? get education {
  final value = _education;
  if (value == null) return null;
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeCopyWith<_Resume> get copyWith => __$ResumeCopyWithImpl<_Resume>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rawFileUrl, rawFileUrl) || other.rawFileUrl == rawFileUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parsedContact, parsedContact) || other.parsedContact == parsedContact)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._experience, _experience)&&const DeepCollectionEquality().equals(other._education, _education)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,rawFileUrl,createdAt,updatedAt,parsedContact,summary,const DeepCollectionEquality().hash(_experience),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'Resume(id: $id, userId: $userId, rawFileUrl: $rawFileUrl, createdAt: $createdAt, updatedAt: $updatedAt, parsedContact: $parsedContact, summary: $summary, experience: $experience, education: $education, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$ResumeCopyWith<$Res> implements $ResumeCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) _then) = __$ResumeCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String rawFileUrl, DateTime createdAt, DateTime updatedAt, ParsedContact? parsedContact, String? summary, List<ExperienceEntry>? experience, List<EducationEntry>? education, List<String>? skills
});


@override $ParsedContactCopyWith<$Res>? get parsedContact;

}
/// @nodoc
class __$ResumeCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(this._self, this._then);

  final _Resume _self;
  final $Res Function(_Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? rawFileUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? parsedContact = freezed,Object? summary = freezed,Object? experience = freezed,Object? education = freezed,Object? skills = freezed,}) {
  return _then(_Resume(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rawFileUrl: null == rawFileUrl ? _self.rawFileUrl : rawFileUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parsedContact: freezed == parsedContact ? _self.parsedContact : parsedContact // ignore: cast_nullable_to_non_nullable
as ParsedContact?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self._experience : experience // ignore: cast_nullable_to_non_nullable
as List<ExperienceEntry>?,education: freezed == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedContactCopyWith<$Res>? get parsedContact {
    if (_self.parsedContact == null) {
    return null;
  }

  return $ParsedContactCopyWith<$Res>(_self.parsedContact!, (value) {
    return _then(_self.copyWith(parsedContact: value));
  });
}
}

// dart format on
