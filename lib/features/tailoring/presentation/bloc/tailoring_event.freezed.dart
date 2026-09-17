// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tailoring_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TailoringEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringEvent()';
}


}

/// @nodoc
class $TailoringEventCopyWith<$Res>  {
$TailoringEventCopyWith(TailoringEvent _, $Res Function(TailoringEvent) __);
}


/// Adds pattern-matching-related methods to [TailoringEvent].
extension TailoringEventPatterns on TailoringEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TailoringStarted value)?  started,TResult Function( TailoringLoadRequested value)?  loadRequested,TResult Function( TailoringCancelRequested value)?  cancelRequested,TResult Function( TailoringBulletToggled value)?  bulletToggled,TResult Function( TailoringAcceptRequested value)?  acceptRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TailoringStarted() when started != null:
return started(_that);case TailoringLoadRequested() when loadRequested != null:
return loadRequested(_that);case TailoringCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case TailoringBulletToggled() when bulletToggled != null:
return bulletToggled(_that);case TailoringAcceptRequested() when acceptRequested != null:
return acceptRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TailoringStarted value)  started,required TResult Function( TailoringLoadRequested value)  loadRequested,required TResult Function( TailoringCancelRequested value)  cancelRequested,required TResult Function( TailoringBulletToggled value)  bulletToggled,required TResult Function( TailoringAcceptRequested value)  acceptRequested,}){
final _that = this;
switch (_that) {
case TailoringStarted():
return started(_that);case TailoringLoadRequested():
return loadRequested(_that);case TailoringCancelRequested():
return cancelRequested(_that);case TailoringBulletToggled():
return bulletToggled(_that);case TailoringAcceptRequested():
return acceptRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TailoringStarted value)?  started,TResult? Function( TailoringLoadRequested value)?  loadRequested,TResult? Function( TailoringCancelRequested value)?  cancelRequested,TResult? Function( TailoringBulletToggled value)?  bulletToggled,TResult? Function( TailoringAcceptRequested value)?  acceptRequested,}){
final _that = this;
switch (_that) {
case TailoringStarted() when started != null:
return started(_that);case TailoringLoadRequested() when loadRequested != null:
return loadRequested(_that);case TailoringCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case TailoringBulletToggled() when bulletToggled != null:
return bulletToggled(_that);case TailoringAcceptRequested() when acceptRequested != null:
return acceptRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String resumeId,  String jobDescriptionId)?  started,TResult Function( String tailoringId)?  loadRequested,TResult Function()?  cancelRequested,TResult Function( String bulletId)?  bulletToggled,TResult Function()?  acceptRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TailoringStarted() when started != null:
return started(_that.resumeId,_that.jobDescriptionId);case TailoringLoadRequested() when loadRequested != null:
return loadRequested(_that.tailoringId);case TailoringCancelRequested() when cancelRequested != null:
return cancelRequested();case TailoringBulletToggled() when bulletToggled != null:
return bulletToggled(_that.bulletId);case TailoringAcceptRequested() when acceptRequested != null:
return acceptRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String resumeId,  String jobDescriptionId)  started,required TResult Function( String tailoringId)  loadRequested,required TResult Function()  cancelRequested,required TResult Function( String bulletId)  bulletToggled,required TResult Function()  acceptRequested,}) {final _that = this;
switch (_that) {
case TailoringStarted():
return started(_that.resumeId,_that.jobDescriptionId);case TailoringLoadRequested():
return loadRequested(_that.tailoringId);case TailoringCancelRequested():
return cancelRequested();case TailoringBulletToggled():
return bulletToggled(_that.bulletId);case TailoringAcceptRequested():
return acceptRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String resumeId,  String jobDescriptionId)?  started,TResult? Function( String tailoringId)?  loadRequested,TResult? Function()?  cancelRequested,TResult? Function( String bulletId)?  bulletToggled,TResult? Function()?  acceptRequested,}) {final _that = this;
switch (_that) {
case TailoringStarted() when started != null:
return started(_that.resumeId,_that.jobDescriptionId);case TailoringLoadRequested() when loadRequested != null:
return loadRequested(_that.tailoringId);case TailoringCancelRequested() when cancelRequested != null:
return cancelRequested();case TailoringBulletToggled() when bulletToggled != null:
return bulletToggled(_that.bulletId);case TailoringAcceptRequested() when acceptRequested != null:
return acceptRequested();case _:
  return null;

}
}

}

/// @nodoc


class TailoringStarted implements TailoringEvent {
  const TailoringStarted({required this.resumeId, required this.jobDescriptionId});
  

 final  String resumeId;
 final  String jobDescriptionId;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringStartedCopyWith<TailoringStarted> get copyWith => _$TailoringStartedCopyWithImpl<TailoringStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringStarted&&(identical(other.resumeId, resumeId) || other.resumeId == resumeId)&&(identical(other.jobDescriptionId, jobDescriptionId) || other.jobDescriptionId == jobDescriptionId));
}


@override
int get hashCode => Object.hash(runtimeType,resumeId,jobDescriptionId);

@override
String toString() {
  return 'TailoringEvent.started(resumeId: $resumeId, jobDescriptionId: $jobDescriptionId)';
}


}

/// @nodoc
abstract mixin class $TailoringStartedCopyWith<$Res> implements $TailoringEventCopyWith<$Res> {
  factory $TailoringStartedCopyWith(TailoringStarted value, $Res Function(TailoringStarted) _then) = _$TailoringStartedCopyWithImpl;
@useResult
$Res call({
 String resumeId, String jobDescriptionId
});




}
/// @nodoc
class _$TailoringStartedCopyWithImpl<$Res>
    implements $TailoringStartedCopyWith<$Res> {
  _$TailoringStartedCopyWithImpl(this._self, this._then);

  final TailoringStarted _self;
  final $Res Function(TailoringStarted) _then;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resumeId = null,Object? jobDescriptionId = null,}) {
  return _then(TailoringStarted(
resumeId: null == resumeId ? _self.resumeId : resumeId // ignore: cast_nullable_to_non_nullable
as String,jobDescriptionId: null == jobDescriptionId ? _self.jobDescriptionId : jobDescriptionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TailoringLoadRequested implements TailoringEvent {
  const TailoringLoadRequested(this.tailoringId);
  

 final  String tailoringId;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringLoadRequestedCopyWith<TailoringLoadRequested> get copyWith => _$TailoringLoadRequestedCopyWithImpl<TailoringLoadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringLoadRequested&&(identical(other.tailoringId, tailoringId) || other.tailoringId == tailoringId));
}


@override
int get hashCode => Object.hash(runtimeType,tailoringId);

@override
String toString() {
  return 'TailoringEvent.loadRequested(tailoringId: $tailoringId)';
}


}

/// @nodoc
abstract mixin class $TailoringLoadRequestedCopyWith<$Res> implements $TailoringEventCopyWith<$Res> {
  factory $TailoringLoadRequestedCopyWith(TailoringLoadRequested value, $Res Function(TailoringLoadRequested) _then) = _$TailoringLoadRequestedCopyWithImpl;
@useResult
$Res call({
 String tailoringId
});




}
/// @nodoc
class _$TailoringLoadRequestedCopyWithImpl<$Res>
    implements $TailoringLoadRequestedCopyWith<$Res> {
  _$TailoringLoadRequestedCopyWithImpl(this._self, this._then);

  final TailoringLoadRequested _self;
  final $Res Function(TailoringLoadRequested) _then;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tailoringId = null,}) {
  return _then(TailoringLoadRequested(
null == tailoringId ? _self.tailoringId : tailoringId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TailoringCancelRequested implements TailoringEvent {
  const TailoringCancelRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringCancelRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringEvent.cancelRequested()';
}


}




/// @nodoc


class TailoringBulletToggled implements TailoringEvent {
  const TailoringBulletToggled(this.bulletId);
  

 final  String bulletId;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringBulletToggledCopyWith<TailoringBulletToggled> get copyWith => _$TailoringBulletToggledCopyWithImpl<TailoringBulletToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringBulletToggled&&(identical(other.bulletId, bulletId) || other.bulletId == bulletId));
}


@override
int get hashCode => Object.hash(runtimeType,bulletId);

@override
String toString() {
  return 'TailoringEvent.bulletToggled(bulletId: $bulletId)';
}


}

/// @nodoc
abstract mixin class $TailoringBulletToggledCopyWith<$Res> implements $TailoringEventCopyWith<$Res> {
  factory $TailoringBulletToggledCopyWith(TailoringBulletToggled value, $Res Function(TailoringBulletToggled) _then) = _$TailoringBulletToggledCopyWithImpl;
@useResult
$Res call({
 String bulletId
});




}
/// @nodoc
class _$TailoringBulletToggledCopyWithImpl<$Res>
    implements $TailoringBulletToggledCopyWith<$Res> {
  _$TailoringBulletToggledCopyWithImpl(this._self, this._then);

  final TailoringBulletToggled _self;
  final $Res Function(TailoringBulletToggled) _then;

/// Create a copy of TailoringEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bulletId = null,}) {
  return _then(TailoringBulletToggled(
null == bulletId ? _self.bulletId : bulletId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TailoringAcceptRequested implements TailoringEvent {
  const TailoringAcceptRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringAcceptRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringEvent.acceptRequested()';
}


}




// dart format on
