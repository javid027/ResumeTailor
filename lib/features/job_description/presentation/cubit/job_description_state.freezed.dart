// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_description_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobDescriptionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescriptionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobDescriptionState()';
}


}

/// @nodoc
class $JobDescriptionStateCopyWith<$Res>  {
$JobDescriptionStateCopyWith(JobDescriptionState _, $Res Function(JobDescriptionState) __);
}


/// Adds pattern-matching-related methods to [JobDescriptionState].
extension JobDescriptionStatePatterns on JobDescriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( JobDescriptionInitial value)?  initial,TResult Function( JobDescriptionSubmitting value)?  submitting,TResult Function( JobDescriptionSuccess value)?  success,TResult Function( JobDescriptionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case JobDescriptionInitial() when initial != null:
return initial(_that);case JobDescriptionSubmitting() when submitting != null:
return submitting(_that);case JobDescriptionSuccess() when success != null:
return success(_that);case JobDescriptionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( JobDescriptionInitial value)  initial,required TResult Function( JobDescriptionSubmitting value)  submitting,required TResult Function( JobDescriptionSuccess value)  success,required TResult Function( JobDescriptionFailure value)  failure,}){
final _that = this;
switch (_that) {
case JobDescriptionInitial():
return initial(_that);case JobDescriptionSubmitting():
return submitting(_that);case JobDescriptionSuccess():
return success(_that);case JobDescriptionFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( JobDescriptionInitial value)?  initial,TResult? Function( JobDescriptionSubmitting value)?  submitting,TResult? Function( JobDescriptionSuccess value)?  success,TResult? Function( JobDescriptionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case JobDescriptionInitial() when initial != null:
return initial(_that);case JobDescriptionSubmitting() when submitting != null:
return submitting(_that);case JobDescriptionSuccess() when success != null:
return success(_that);case JobDescriptionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( JobDescription jobDescription)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case JobDescriptionInitial() when initial != null:
return initial();case JobDescriptionSubmitting() when submitting != null:
return submitting();case JobDescriptionSuccess() when success != null:
return success(_that.jobDescription);case JobDescriptionFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( JobDescription jobDescription)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case JobDescriptionInitial():
return initial();case JobDescriptionSubmitting():
return submitting();case JobDescriptionSuccess():
return success(_that.jobDescription);case JobDescriptionFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( JobDescription jobDescription)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case JobDescriptionInitial() when initial != null:
return initial();case JobDescriptionSubmitting() when submitting != null:
return submitting();case JobDescriptionSuccess() when success != null:
return success(_that.jobDescription);case JobDescriptionFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class JobDescriptionInitial implements JobDescriptionState {
  const JobDescriptionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescriptionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobDescriptionState.initial()';
}


}




/// @nodoc


class JobDescriptionSubmitting implements JobDescriptionState {
  const JobDescriptionSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescriptionSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobDescriptionState.submitting()';
}


}




/// @nodoc


class JobDescriptionSuccess implements JobDescriptionState {
  const JobDescriptionSuccess({required this.jobDescription});
  

 final  JobDescription jobDescription;

/// Create a copy of JobDescriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDescriptionSuccessCopyWith<JobDescriptionSuccess> get copyWith => _$JobDescriptionSuccessCopyWithImpl<JobDescriptionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescriptionSuccess&&(identical(other.jobDescription, jobDescription) || other.jobDescription == jobDescription));
}


@override
int get hashCode => Object.hash(runtimeType,jobDescription);

@override
String toString() {
  return 'JobDescriptionState.success(jobDescription: $jobDescription)';
}


}

/// @nodoc
abstract mixin class $JobDescriptionSuccessCopyWith<$Res> implements $JobDescriptionStateCopyWith<$Res> {
  factory $JobDescriptionSuccessCopyWith(JobDescriptionSuccess value, $Res Function(JobDescriptionSuccess) _then) = _$JobDescriptionSuccessCopyWithImpl;
@useResult
$Res call({
 JobDescription jobDescription
});


$JobDescriptionCopyWith<$Res> get jobDescription;

}
/// @nodoc
class _$JobDescriptionSuccessCopyWithImpl<$Res>
    implements $JobDescriptionSuccessCopyWith<$Res> {
  _$JobDescriptionSuccessCopyWithImpl(this._self, this._then);

  final JobDescriptionSuccess _self;
  final $Res Function(JobDescriptionSuccess) _then;

/// Create a copy of JobDescriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jobDescription = null,}) {
  return _then(JobDescriptionSuccess(
jobDescription: null == jobDescription ? _self.jobDescription : jobDescription // ignore: cast_nullable_to_non_nullable
as JobDescription,
  ));
}

/// Create a copy of JobDescriptionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDescriptionCopyWith<$Res> get jobDescription {
  
  return $JobDescriptionCopyWith<$Res>(_self.jobDescription, (value) {
    return _then(_self.copyWith(jobDescription: value));
  });
}
}

/// @nodoc


class JobDescriptionFailure implements JobDescriptionState {
  const JobDescriptionFailure({required this.message});
  

 final  String message;

/// Create a copy of JobDescriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDescriptionFailureCopyWith<JobDescriptionFailure> get copyWith => _$JobDescriptionFailureCopyWithImpl<JobDescriptionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDescriptionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'JobDescriptionState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $JobDescriptionFailureCopyWith<$Res> implements $JobDescriptionStateCopyWith<$Res> {
  factory $JobDescriptionFailureCopyWith(JobDescriptionFailure value, $Res Function(JobDescriptionFailure) _then) = _$JobDescriptionFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$JobDescriptionFailureCopyWithImpl<$Res>
    implements $JobDescriptionFailureCopyWith<$Res> {
  _$JobDescriptionFailureCopyWithImpl(this._self, this._then);

  final JobDescriptionFailure _self;
  final $Res Function(JobDescriptionFailure) _then;

/// Create a copy of JobDescriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(JobDescriptionFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
