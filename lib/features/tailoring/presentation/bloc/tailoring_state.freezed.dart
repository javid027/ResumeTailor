// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tailoring_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TailoringState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringState()';
}


}

/// @nodoc
class $TailoringStateCopyWith<$Res>  {
$TailoringStateCopyWith(TailoringState _, $Res Function(TailoringState) __);
}


/// Adds pattern-matching-related methods to [TailoringState].
extension TailoringStatePatterns on TailoringState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TailoringInitial value)?  initial,TResult Function( TailoringInProgress value)?  inProgress,TResult Function( TailoringLoaded value)?  loaded,TResult Function( TailoringAccepting value)?  accepting,TResult Function( TailoringAcceptFailure value)?  acceptFailure,TResult Function( TailoringFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TailoringInitial() when initial != null:
return initial(_that);case TailoringInProgress() when inProgress != null:
return inProgress(_that);case TailoringLoaded() when loaded != null:
return loaded(_that);case TailoringAccepting() when accepting != null:
return accepting(_that);case TailoringAcceptFailure() when acceptFailure != null:
return acceptFailure(_that);case TailoringFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TailoringInitial value)  initial,required TResult Function( TailoringInProgress value)  inProgress,required TResult Function( TailoringLoaded value)  loaded,required TResult Function( TailoringAccepting value)  accepting,required TResult Function( TailoringAcceptFailure value)  acceptFailure,required TResult Function( TailoringFailure value)  failure,}){
final _that = this;
switch (_that) {
case TailoringInitial():
return initial(_that);case TailoringInProgress():
return inProgress(_that);case TailoringLoaded():
return loaded(_that);case TailoringAccepting():
return accepting(_that);case TailoringAcceptFailure():
return acceptFailure(_that);case TailoringFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TailoringInitial value)?  initial,TResult? Function( TailoringInProgress value)?  inProgress,TResult? Function( TailoringLoaded value)?  loaded,TResult? Function( TailoringAccepting value)?  accepting,TResult? Function( TailoringAcceptFailure value)?  acceptFailure,TResult? Function( TailoringFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TailoringInitial() when initial != null:
return initial(_that);case TailoringInProgress() when inProgress != null:
return inProgress(_that);case TailoringLoaded() when loaded != null:
return loaded(_that);case TailoringAccepting() when accepting != null:
return accepting(_that);case TailoringAcceptFailure() when acceptFailure != null:
return acceptFailure(_that);case TailoringFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function( TailoringResult result,  Set<String> selectedBulletIds)?  loaded,TResult Function( TailoringResult result,  Set<String> selectedBulletIds)?  accepting,TResult Function( TailoringResult result,  Set<String> selectedBulletIds,  String message)?  acceptFailure,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TailoringInitial() when initial != null:
return initial();case TailoringInProgress() when inProgress != null:
return inProgress();case TailoringLoaded() when loaded != null:
return loaded(_that.result,_that.selectedBulletIds);case TailoringAccepting() when accepting != null:
return accepting(_that.result,_that.selectedBulletIds);case TailoringAcceptFailure() when acceptFailure != null:
return acceptFailure(_that.result,_that.selectedBulletIds,_that.message);case TailoringFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function( TailoringResult result,  Set<String> selectedBulletIds)  loaded,required TResult Function( TailoringResult result,  Set<String> selectedBulletIds)  accepting,required TResult Function( TailoringResult result,  Set<String> selectedBulletIds,  String message)  acceptFailure,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case TailoringInitial():
return initial();case TailoringInProgress():
return inProgress();case TailoringLoaded():
return loaded(_that.result,_that.selectedBulletIds);case TailoringAccepting():
return accepting(_that.result,_that.selectedBulletIds);case TailoringAcceptFailure():
return acceptFailure(_that.result,_that.selectedBulletIds,_that.message);case TailoringFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function( TailoringResult result,  Set<String> selectedBulletIds)?  loaded,TResult? Function( TailoringResult result,  Set<String> selectedBulletIds)?  accepting,TResult? Function( TailoringResult result,  Set<String> selectedBulletIds,  String message)?  acceptFailure,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case TailoringInitial() when initial != null:
return initial();case TailoringInProgress() when inProgress != null:
return inProgress();case TailoringLoaded() when loaded != null:
return loaded(_that.result,_that.selectedBulletIds);case TailoringAccepting() when accepting != null:
return accepting(_that.result,_that.selectedBulletIds);case TailoringAcceptFailure() when acceptFailure != null:
return acceptFailure(_that.result,_that.selectedBulletIds,_that.message);case TailoringFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TailoringInitial implements TailoringState {
  const TailoringInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringState.initial()';
}


}




/// @nodoc


class TailoringInProgress implements TailoringState {
  const TailoringInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TailoringState.inProgress()';
}


}




/// @nodoc


class TailoringLoaded implements TailoringState {
  const TailoringLoaded({required this.result, required final  Set<String> selectedBulletIds}): _selectedBulletIds = selectedBulletIds;
  

 final  TailoringResult result;
 final  Set<String> _selectedBulletIds;
 Set<String> get selectedBulletIds {
  if (_selectedBulletIds is EqualUnmodifiableSetView) return _selectedBulletIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedBulletIds);
}


/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringLoadedCopyWith<TailoringLoaded> get copyWith => _$TailoringLoadedCopyWithImpl<TailoringLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringLoaded&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other._selectedBulletIds, _selectedBulletIds));
}


@override
int get hashCode => Object.hash(runtimeType,result,const DeepCollectionEquality().hash(_selectedBulletIds));

@override
String toString() {
  return 'TailoringState.loaded(result: $result, selectedBulletIds: $selectedBulletIds)';
}


}

/// @nodoc
abstract mixin class $TailoringLoadedCopyWith<$Res> implements $TailoringStateCopyWith<$Res> {
  factory $TailoringLoadedCopyWith(TailoringLoaded value, $Res Function(TailoringLoaded) _then) = _$TailoringLoadedCopyWithImpl;
@useResult
$Res call({
 TailoringResult result, Set<String> selectedBulletIds
});


$TailoringResultCopyWith<$Res> get result;

}
/// @nodoc
class _$TailoringLoadedCopyWithImpl<$Res>
    implements $TailoringLoadedCopyWith<$Res> {
  _$TailoringLoadedCopyWithImpl(this._self, this._then);

  final TailoringLoaded _self;
  final $Res Function(TailoringLoaded) _then;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,Object? selectedBulletIds = null,}) {
  return _then(TailoringLoaded(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TailoringResult,selectedBulletIds: null == selectedBulletIds ? _self._selectedBulletIds : selectedBulletIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TailoringResultCopyWith<$Res> get result {
  
  return $TailoringResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class TailoringAccepting implements TailoringState {
  const TailoringAccepting({required this.result, required final  Set<String> selectedBulletIds}): _selectedBulletIds = selectedBulletIds;
  

 final  TailoringResult result;
 final  Set<String> _selectedBulletIds;
 Set<String> get selectedBulletIds {
  if (_selectedBulletIds is EqualUnmodifiableSetView) return _selectedBulletIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedBulletIds);
}


/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringAcceptingCopyWith<TailoringAccepting> get copyWith => _$TailoringAcceptingCopyWithImpl<TailoringAccepting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringAccepting&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other._selectedBulletIds, _selectedBulletIds));
}


@override
int get hashCode => Object.hash(runtimeType,result,const DeepCollectionEquality().hash(_selectedBulletIds));

@override
String toString() {
  return 'TailoringState.accepting(result: $result, selectedBulletIds: $selectedBulletIds)';
}


}

/// @nodoc
abstract mixin class $TailoringAcceptingCopyWith<$Res> implements $TailoringStateCopyWith<$Res> {
  factory $TailoringAcceptingCopyWith(TailoringAccepting value, $Res Function(TailoringAccepting) _then) = _$TailoringAcceptingCopyWithImpl;
@useResult
$Res call({
 TailoringResult result, Set<String> selectedBulletIds
});


$TailoringResultCopyWith<$Res> get result;

}
/// @nodoc
class _$TailoringAcceptingCopyWithImpl<$Res>
    implements $TailoringAcceptingCopyWith<$Res> {
  _$TailoringAcceptingCopyWithImpl(this._self, this._then);

  final TailoringAccepting _self;
  final $Res Function(TailoringAccepting) _then;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,Object? selectedBulletIds = null,}) {
  return _then(TailoringAccepting(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TailoringResult,selectedBulletIds: null == selectedBulletIds ? _self._selectedBulletIds : selectedBulletIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TailoringResultCopyWith<$Res> get result {
  
  return $TailoringResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class TailoringAcceptFailure implements TailoringState {
  const TailoringAcceptFailure({required this.result, required final  Set<String> selectedBulletIds, required this.message}): _selectedBulletIds = selectedBulletIds;
  

 final  TailoringResult result;
 final  Set<String> _selectedBulletIds;
 Set<String> get selectedBulletIds {
  if (_selectedBulletIds is EqualUnmodifiableSetView) return _selectedBulletIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedBulletIds);
}

 final  String message;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringAcceptFailureCopyWith<TailoringAcceptFailure> get copyWith => _$TailoringAcceptFailureCopyWithImpl<TailoringAcceptFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringAcceptFailure&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other._selectedBulletIds, _selectedBulletIds)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,result,const DeepCollectionEquality().hash(_selectedBulletIds),message);

@override
String toString() {
  return 'TailoringState.acceptFailure(result: $result, selectedBulletIds: $selectedBulletIds, message: $message)';
}


}

/// @nodoc
abstract mixin class $TailoringAcceptFailureCopyWith<$Res> implements $TailoringStateCopyWith<$Res> {
  factory $TailoringAcceptFailureCopyWith(TailoringAcceptFailure value, $Res Function(TailoringAcceptFailure) _then) = _$TailoringAcceptFailureCopyWithImpl;
@useResult
$Res call({
 TailoringResult result, Set<String> selectedBulletIds, String message
});


$TailoringResultCopyWith<$Res> get result;

}
/// @nodoc
class _$TailoringAcceptFailureCopyWithImpl<$Res>
    implements $TailoringAcceptFailureCopyWith<$Res> {
  _$TailoringAcceptFailureCopyWithImpl(this._self, this._then);

  final TailoringAcceptFailure _self;
  final $Res Function(TailoringAcceptFailure) _then;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,Object? selectedBulletIds = null,Object? message = null,}) {
  return _then(TailoringAcceptFailure(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TailoringResult,selectedBulletIds: null == selectedBulletIds ? _self._selectedBulletIds : selectedBulletIds // ignore: cast_nullable_to_non_nullable
as Set<String>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TailoringResultCopyWith<$Res> get result {
  
  return $TailoringResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class TailoringFailure implements TailoringState {
  const TailoringFailure({required this.message});
  

 final  String message;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TailoringFailureCopyWith<TailoringFailure> get copyWith => _$TailoringFailureCopyWithImpl<TailoringFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TailoringFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TailoringState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TailoringFailureCopyWith<$Res> implements $TailoringStateCopyWith<$Res> {
  factory $TailoringFailureCopyWith(TailoringFailure value, $Res Function(TailoringFailure) _then) = _$TailoringFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TailoringFailureCopyWithImpl<$Res>
    implements $TailoringFailureCopyWith<$Res> {
  _$TailoringFailureCopyWithImpl(this._self, this._then);

  final TailoringFailure _self;
  final $Res Function(TailoringFailure) _then;

/// Create a copy of TailoringState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TailoringFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
