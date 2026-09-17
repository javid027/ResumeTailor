// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResumeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResumeState()';
}


}

/// @nodoc
class $ResumeStateCopyWith<$Res>  {
$ResumeStateCopyWith(ResumeState _, $Res Function(ResumeState) __);
}


/// Adds pattern-matching-related methods to [ResumeState].
extension ResumeStatePatterns on ResumeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResumeInitial value)?  initial,TResult Function( ResumeUploading value)?  uploading,TResult Function( ResumeUploadFailure value)?  uploadFailure,TResult Function( ResumeLoaded value)?  loaded,TResult Function( ResumeSaving value)?  saving,TResult Function( ResumeSaveFailure value)?  saveFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResumeInitial() when initial != null:
return initial(_that);case ResumeUploading() when uploading != null:
return uploading(_that);case ResumeUploadFailure() when uploadFailure != null:
return uploadFailure(_that);case ResumeLoaded() when loaded != null:
return loaded(_that);case ResumeSaving() when saving != null:
return saving(_that);case ResumeSaveFailure() when saveFailure != null:
return saveFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResumeInitial value)  initial,required TResult Function( ResumeUploading value)  uploading,required TResult Function( ResumeUploadFailure value)  uploadFailure,required TResult Function( ResumeLoaded value)  loaded,required TResult Function( ResumeSaving value)  saving,required TResult Function( ResumeSaveFailure value)  saveFailure,}){
final _that = this;
switch (_that) {
case ResumeInitial():
return initial(_that);case ResumeUploading():
return uploading(_that);case ResumeUploadFailure():
return uploadFailure(_that);case ResumeLoaded():
return loaded(_that);case ResumeSaving():
return saving(_that);case ResumeSaveFailure():
return saveFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResumeInitial value)?  initial,TResult? Function( ResumeUploading value)?  uploading,TResult? Function( ResumeUploadFailure value)?  uploadFailure,TResult? Function( ResumeLoaded value)?  loaded,TResult? Function( ResumeSaving value)?  saving,TResult? Function( ResumeSaveFailure value)?  saveFailure,}){
final _that = this;
switch (_that) {
case ResumeInitial() when initial != null:
return initial(_that);case ResumeUploading() when uploading != null:
return uploading(_that);case ResumeUploadFailure() when uploadFailure != null:
return uploadFailure(_that);case ResumeLoaded() when loaded != null:
return loaded(_that);case ResumeSaving() when saving != null:
return saving(_that);case ResumeSaveFailure() when saveFailure != null:
return saveFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  uploading,TResult Function( String message)?  uploadFailure,TResult Function( Resume resume)?  loaded,TResult Function( Resume resume)?  saving,TResult Function( Resume resume,  String message)?  saveFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResumeInitial() when initial != null:
return initial();case ResumeUploading() when uploading != null:
return uploading();case ResumeUploadFailure() when uploadFailure != null:
return uploadFailure(_that.message);case ResumeLoaded() when loaded != null:
return loaded(_that.resume);case ResumeSaving() when saving != null:
return saving(_that.resume);case ResumeSaveFailure() when saveFailure != null:
return saveFailure(_that.resume,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  uploading,required TResult Function( String message)  uploadFailure,required TResult Function( Resume resume)  loaded,required TResult Function( Resume resume)  saving,required TResult Function( Resume resume,  String message)  saveFailure,}) {final _that = this;
switch (_that) {
case ResumeInitial():
return initial();case ResumeUploading():
return uploading();case ResumeUploadFailure():
return uploadFailure(_that.message);case ResumeLoaded():
return loaded(_that.resume);case ResumeSaving():
return saving(_that.resume);case ResumeSaveFailure():
return saveFailure(_that.resume,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  uploading,TResult? Function( String message)?  uploadFailure,TResult? Function( Resume resume)?  loaded,TResult? Function( Resume resume)?  saving,TResult? Function( Resume resume,  String message)?  saveFailure,}) {final _that = this;
switch (_that) {
case ResumeInitial() when initial != null:
return initial();case ResumeUploading() when uploading != null:
return uploading();case ResumeUploadFailure() when uploadFailure != null:
return uploadFailure(_that.message);case ResumeLoaded() when loaded != null:
return loaded(_that.resume);case ResumeSaving() when saving != null:
return saving(_that.resume);case ResumeSaveFailure() when saveFailure != null:
return saveFailure(_that.resume,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ResumeInitial implements ResumeState {
  const ResumeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResumeState.initial()';
}


}




/// @nodoc


class ResumeUploading implements ResumeState {
  const ResumeUploading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeUploading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResumeState.uploading()';
}


}




/// @nodoc


class ResumeUploadFailure implements ResumeState {
  const ResumeUploadFailure({required this.message});
  

 final  String message;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeUploadFailureCopyWith<ResumeUploadFailure> get copyWith => _$ResumeUploadFailureCopyWithImpl<ResumeUploadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeUploadFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResumeState.uploadFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResumeUploadFailureCopyWith<$Res> implements $ResumeStateCopyWith<$Res> {
  factory $ResumeUploadFailureCopyWith(ResumeUploadFailure value, $Res Function(ResumeUploadFailure) _then) = _$ResumeUploadFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResumeUploadFailureCopyWithImpl<$Res>
    implements $ResumeUploadFailureCopyWith<$Res> {
  _$ResumeUploadFailureCopyWithImpl(this._self, this._then);

  final ResumeUploadFailure _self;
  final $Res Function(ResumeUploadFailure) _then;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResumeUploadFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResumeLoaded implements ResumeState {
  const ResumeLoaded({required this.resume});
  

 final  Resume resume;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeLoadedCopyWith<ResumeLoaded> get copyWith => _$ResumeLoadedCopyWithImpl<ResumeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeLoaded&&(identical(other.resume, resume) || other.resume == resume));
}


@override
int get hashCode => Object.hash(runtimeType,resume);

@override
String toString() {
  return 'ResumeState.loaded(resume: $resume)';
}


}

/// @nodoc
abstract mixin class $ResumeLoadedCopyWith<$Res> implements $ResumeStateCopyWith<$Res> {
  factory $ResumeLoadedCopyWith(ResumeLoaded value, $Res Function(ResumeLoaded) _then) = _$ResumeLoadedCopyWithImpl;
@useResult
$Res call({
 Resume resume
});


$ResumeCopyWith<$Res> get resume;

}
/// @nodoc
class _$ResumeLoadedCopyWithImpl<$Res>
    implements $ResumeLoadedCopyWith<$Res> {
  _$ResumeLoadedCopyWithImpl(this._self, this._then);

  final ResumeLoaded _self;
  final $Res Function(ResumeLoaded) _then;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,}) {
  return _then(ResumeLoaded(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as Resume,
  ));
}

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeCopyWith<$Res> get resume {
  
  return $ResumeCopyWith<$Res>(_self.resume, (value) {
    return _then(_self.copyWith(resume: value));
  });
}
}

/// @nodoc


class ResumeSaving implements ResumeState {
  const ResumeSaving({required this.resume});
  

 final  Resume resume;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeSavingCopyWith<ResumeSaving> get copyWith => _$ResumeSavingCopyWithImpl<ResumeSaving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeSaving&&(identical(other.resume, resume) || other.resume == resume));
}


@override
int get hashCode => Object.hash(runtimeType,resume);

@override
String toString() {
  return 'ResumeState.saving(resume: $resume)';
}


}

/// @nodoc
abstract mixin class $ResumeSavingCopyWith<$Res> implements $ResumeStateCopyWith<$Res> {
  factory $ResumeSavingCopyWith(ResumeSaving value, $Res Function(ResumeSaving) _then) = _$ResumeSavingCopyWithImpl;
@useResult
$Res call({
 Resume resume
});


$ResumeCopyWith<$Res> get resume;

}
/// @nodoc
class _$ResumeSavingCopyWithImpl<$Res>
    implements $ResumeSavingCopyWith<$Res> {
  _$ResumeSavingCopyWithImpl(this._self, this._then);

  final ResumeSaving _self;
  final $Res Function(ResumeSaving) _then;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,}) {
  return _then(ResumeSaving(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as Resume,
  ));
}

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeCopyWith<$Res> get resume {
  
  return $ResumeCopyWith<$Res>(_self.resume, (value) {
    return _then(_self.copyWith(resume: value));
  });
}
}

/// @nodoc


class ResumeSaveFailure implements ResumeState {
  const ResumeSaveFailure({required this.resume, required this.message});
  

 final  Resume resume;
 final  String message;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeSaveFailureCopyWith<ResumeSaveFailure> get copyWith => _$ResumeSaveFailureCopyWithImpl<ResumeSaveFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeSaveFailure&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,resume,message);

@override
String toString() {
  return 'ResumeState.saveFailure(resume: $resume, message: $message)';
}


}

/// @nodoc
abstract mixin class $ResumeSaveFailureCopyWith<$Res> implements $ResumeStateCopyWith<$Res> {
  factory $ResumeSaveFailureCopyWith(ResumeSaveFailure value, $Res Function(ResumeSaveFailure) _then) = _$ResumeSaveFailureCopyWithImpl;
@useResult
$Res call({
 Resume resume, String message
});


$ResumeCopyWith<$Res> get resume;

}
/// @nodoc
class _$ResumeSaveFailureCopyWithImpl<$Res>
    implements $ResumeSaveFailureCopyWith<$Res> {
  _$ResumeSaveFailureCopyWithImpl(this._self, this._then);

  final ResumeSaveFailure _self;
  final $Res Function(ResumeSaveFailure) _then;

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resume = null,Object? message = null,}) {
  return _then(ResumeSaveFailure(
resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as Resume,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ResumeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResumeCopyWith<$Res> get resume {
  
  return $ResumeCopyWith<$Res>(_self.resume, (value) {
    return _then(_self.copyWith(resume: value));
  });
}
}

// dart format on
