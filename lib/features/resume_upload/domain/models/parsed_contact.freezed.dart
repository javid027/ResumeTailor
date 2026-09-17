// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParsedContact {

 String? get name; String? get email; String? get phone; String? get location;
/// Create a copy of ParsedContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedContactCopyWith<ParsedContact> get copyWith => _$ParsedContactCopyWithImpl<ParsedContact>(this as ParsedContact, _$identity);

  /// Serializes this ParsedContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedContact&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,location);

@override
String toString() {
  return 'ParsedContact(name: $name, email: $email, phone: $phone, location: $location)';
}


}

/// @nodoc
abstract mixin class $ParsedContactCopyWith<$Res>  {
  factory $ParsedContactCopyWith(ParsedContact value, $Res Function(ParsedContact) _then) = _$ParsedContactCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? phone, String? location
});




}
/// @nodoc
class _$ParsedContactCopyWithImpl<$Res>
    implements $ParsedContactCopyWith<$Res> {
  _$ParsedContactCopyWithImpl(this._self, this._then);

  final ParsedContact _self;
  final $Res Function(ParsedContact) _then;

/// Create a copy of ParsedContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedContact].
extension ParsedContactPatterns on ParsedContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedContact value)  $default,){
final _that = this;
switch (_that) {
case _ParsedContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedContact value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedContact() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? location)  $default,) {final _that = this;
switch (_that) {
case _ParsedContact():
return $default(_that.name,_that.email,_that.phone,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? phone,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _ParsedContact() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParsedContact implements ParsedContact {
  const _ParsedContact({this.name, this.email, this.phone, this.location});
  factory _ParsedContact.fromJson(Map<String, dynamic> json) => _$ParsedContactFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String? location;

/// Create a copy of ParsedContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedContactCopyWith<_ParsedContact> get copyWith => __$ParsedContactCopyWithImpl<_ParsedContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParsedContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedContact&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,location);

@override
String toString() {
  return 'ParsedContact(name: $name, email: $email, phone: $phone, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ParsedContactCopyWith<$Res> implements $ParsedContactCopyWith<$Res> {
  factory _$ParsedContactCopyWith(_ParsedContact value, $Res Function(_ParsedContact) _then) = __$ParsedContactCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? phone, String? location
});




}
/// @nodoc
class __$ParsedContactCopyWithImpl<$Res>
    implements _$ParsedContactCopyWith<$Res> {
  __$ParsedContactCopyWithImpl(this._self, this._then);

  final _ParsedContact _self;
  final $Res Function(_ParsedContact) _then;

/// Create a copy of ParsedContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? location = freezed,}) {
  return _then(_ParsedContact(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
