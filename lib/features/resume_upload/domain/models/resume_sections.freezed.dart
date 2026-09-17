// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_sections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResumeSections {

 ParsedContact? get parsedContact; String? get summary; List<ExperienceEntry>? get experience; List<EducationEntry>? get education; List<String>? get skills;
/// Create a copy of ResumeSections
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeSectionsCopyWith<ResumeSections> get copyWith => _$ResumeSectionsCopyWithImpl<ResumeSections>(this as ResumeSections, _$identity);

  /// Serializes this ResumeSections to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeSections&&(identical(other.parsedContact, parsedContact) || other.parsedContact == parsedContact)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.experience, experience)&&const DeepCollectionEquality().equals(other.education, education)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parsedContact,summary,const DeepCollectionEquality().hash(experience),const DeepCollectionEquality().hash(education),const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'ResumeSections(parsedContact: $parsedContact, summary: $summary, experience: $experience, education: $education, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $ResumeSectionsCopyWith<$Res>  {
  factory $ResumeSectionsCopyWith(ResumeSections value, $Res Function(ResumeSections) _then) = _$ResumeSectionsCopyWithImpl;
@useResult
$Res call({
 ParsedContact? parsedContact, String? summary, List<ExperienceEntry>? experience, List<EducationEntry>? education, List<String>? skills
});


$ParsedContactCopyWith<$Res>? get parsedContact;

}
/// @nodoc
class _$ResumeSectionsCopyWithImpl<$Res>
    implements $ResumeSectionsCopyWith<$Res> {
  _$ResumeSectionsCopyWithImpl(this._self, this._then);

  final ResumeSections _self;
  final $Res Function(ResumeSections) _then;

/// Create a copy of ResumeSections
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parsedContact = freezed,Object? summary = freezed,Object? experience = freezed,Object? education = freezed,Object? skills = freezed,}) {
  return _then(_self.copyWith(
parsedContact: freezed == parsedContact ? _self.parsedContact : parsedContact // ignore: cast_nullable_to_non_nullable
as ParsedContact?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as List<ExperienceEntry>?,education: freezed == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ResumeSections
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


/// Adds pattern-matching-related methods to [ResumeSections].
extension ResumeSectionsPatterns on ResumeSections {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumeSections value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumeSections() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumeSections value)  $default,){
final _that = this;
switch (_that) {
case _ResumeSections():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumeSections value)?  $default,){
final _that = this;
switch (_that) {
case _ResumeSections() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumeSections() when $default != null:
return $default(_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)  $default,) {final _that = this;
switch (_that) {
case _ResumeSections():
return $default(_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ParsedContact? parsedContact,  String? summary,  List<ExperienceEntry>? experience,  List<EducationEntry>? education,  List<String>? skills)?  $default,) {final _that = this;
switch (_that) {
case _ResumeSections() when $default != null:
return $default(_that.parsedContact,_that.summary,_that.experience,_that.education,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResumeSections implements ResumeSections {
  const _ResumeSections({this.parsedContact, this.summary, final  List<ExperienceEntry>? experience, final  List<EducationEntry>? education, final  List<String>? skills}): _experience = experience,_education = education,_skills = skills;
  factory _ResumeSections.fromJson(Map<String, dynamic> json) => _$ResumeSectionsFromJson(json);

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


/// Create a copy of ResumeSections
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeSectionsCopyWith<_ResumeSections> get copyWith => __$ResumeSectionsCopyWithImpl<_ResumeSections>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeSectionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeSections&&(identical(other.parsedContact, parsedContact) || other.parsedContact == parsedContact)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._experience, _experience)&&const DeepCollectionEquality().equals(other._education, _education)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parsedContact,summary,const DeepCollectionEquality().hash(_experience),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'ResumeSections(parsedContact: $parsedContact, summary: $summary, experience: $experience, education: $education, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$ResumeSectionsCopyWith<$Res> implements $ResumeSectionsCopyWith<$Res> {
  factory _$ResumeSectionsCopyWith(_ResumeSections value, $Res Function(_ResumeSections) _then) = __$ResumeSectionsCopyWithImpl;
@override @useResult
$Res call({
 ParsedContact? parsedContact, String? summary, List<ExperienceEntry>? experience, List<EducationEntry>? education, List<String>? skills
});


@override $ParsedContactCopyWith<$Res>? get parsedContact;

}
/// @nodoc
class __$ResumeSectionsCopyWithImpl<$Res>
    implements _$ResumeSectionsCopyWith<$Res> {
  __$ResumeSectionsCopyWithImpl(this._self, this._then);

  final _ResumeSections _self;
  final $Res Function(_ResumeSections) _then;

/// Create a copy of ResumeSections
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parsedContact = freezed,Object? summary = freezed,Object? experience = freezed,Object? education = freezed,Object? skills = freezed,}) {
  return _then(_ResumeSections(
parsedContact: freezed == parsedContact ? _self.parsedContact : parsedContact // ignore: cast_nullable_to_non_nullable
as ParsedContact?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,experience: freezed == experience ? _self._experience : experience // ignore: cast_nullable_to_non_nullable
as List<ExperienceEntry>?,education: freezed == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ResumeSections
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
