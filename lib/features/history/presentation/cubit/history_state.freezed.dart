// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState()';
}


}

/// @nodoc
class $HistoryStateCopyWith<$Res>  {
$HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoryInitial value)?  initial,TResult Function( HistoryLoading value)?  loading,TResult Function( HistoryLoaded value)?  loaded,TResult Function( HistoryLoadingMore value)?  loadingMore,TResult Function( HistoryLoadMoreFailure value)?  loadMoreFailure,TResult Function( HistoryFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial(_that);case HistoryLoading() when loading != null:
return loading(_that);case HistoryLoaded() when loaded != null:
return loaded(_that);case HistoryLoadingMore() when loadingMore != null:
return loadingMore(_that);case HistoryLoadMoreFailure() when loadMoreFailure != null:
return loadMoreFailure(_that);case HistoryFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoryInitial value)  initial,required TResult Function( HistoryLoading value)  loading,required TResult Function( HistoryLoaded value)  loaded,required TResult Function( HistoryLoadingMore value)  loadingMore,required TResult Function( HistoryLoadMoreFailure value)  loadMoreFailure,required TResult Function( HistoryFailure value)  failure,}){
final _that = this;
switch (_that) {
case HistoryInitial():
return initial(_that);case HistoryLoading():
return loading(_that);case HistoryLoaded():
return loaded(_that);case HistoryLoadingMore():
return loadingMore(_that);case HistoryLoadMoreFailure():
return loadMoreFailure(_that);case HistoryFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoryInitial value)?  initial,TResult? Function( HistoryLoading value)?  loading,TResult? Function( HistoryLoaded value)?  loaded,TResult? Function( HistoryLoadingMore value)?  loadingMore,TResult? Function( HistoryLoadMoreFailure value)?  loadMoreFailure,TResult? Function( HistoryFailure value)?  failure,}){
final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial(_that);case HistoryLoading() when loading != null:
return loading(_that);case HistoryLoaded() when loaded != null:
return loaded(_that);case HistoryLoadingMore() when loadingMore != null:
return loadingMore(_that);case HistoryLoadMoreFailure() when loadMoreFailure != null:
return loadMoreFailure(_that);case HistoryFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HistoryItem> items,  int total)?  loaded,TResult Function( List<HistoryItem> items,  int total)?  loadingMore,TResult Function( List<HistoryItem> items,  int total,  String message)?  loadMoreFailure,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial();case HistoryLoading() when loading != null:
return loading();case HistoryLoaded() when loaded != null:
return loaded(_that.items,_that.total);case HistoryLoadingMore() when loadingMore != null:
return loadingMore(_that.items,_that.total);case HistoryLoadMoreFailure() when loadMoreFailure != null:
return loadMoreFailure(_that.items,_that.total,_that.message);case HistoryFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HistoryItem> items,  int total)  loaded,required TResult Function( List<HistoryItem> items,  int total)  loadingMore,required TResult Function( List<HistoryItem> items,  int total,  String message)  loadMoreFailure,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case HistoryInitial():
return initial();case HistoryLoading():
return loading();case HistoryLoaded():
return loaded(_that.items,_that.total);case HistoryLoadingMore():
return loadingMore(_that.items,_that.total);case HistoryLoadMoreFailure():
return loadMoreFailure(_that.items,_that.total,_that.message);case HistoryFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HistoryItem> items,  int total)?  loaded,TResult? Function( List<HistoryItem> items,  int total)?  loadingMore,TResult? Function( List<HistoryItem> items,  int total,  String message)?  loadMoreFailure,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial();case HistoryLoading() when loading != null:
return loading();case HistoryLoaded() when loaded != null:
return loaded(_that.items,_that.total);case HistoryLoadingMore() when loadingMore != null:
return loadingMore(_that.items,_that.total);case HistoryLoadMoreFailure() when loadMoreFailure != null:
return loadMoreFailure(_that.items,_that.total,_that.message);case HistoryFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HistoryInitial implements HistoryState {
  const HistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.initial()';
}


}




/// @nodoc


class HistoryLoading implements HistoryState {
  const HistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.loading()';
}


}




/// @nodoc


class HistoryLoaded implements HistoryState {
  const HistoryLoaded({required final  List<HistoryItem> items, required this.total}): _items = items;
  

 final  List<HistoryItem> _items;
 List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  int total;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryLoadedCopyWith<HistoryLoaded> get copyWith => _$HistoryLoadedCopyWithImpl<HistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryLoaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total);

@override
String toString() {
  return 'HistoryState.loaded(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class $HistoryLoadedCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryLoadedCopyWith(HistoryLoaded value, $Res Function(HistoryLoaded) _then) = _$HistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<HistoryItem> items, int total
});




}
/// @nodoc
class _$HistoryLoadedCopyWithImpl<$Res>
    implements $HistoryLoadedCopyWith<$Res> {
  _$HistoryLoadedCopyWithImpl(this._self, this._then);

  final HistoryLoaded _self;
  final $Res Function(HistoryLoaded) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,}) {
  return _then(HistoryLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class HistoryLoadingMore implements HistoryState {
  const HistoryLoadingMore({required final  List<HistoryItem> items, required this.total}): _items = items;
  

 final  List<HistoryItem> _items;
 List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  int total;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryLoadingMoreCopyWith<HistoryLoadingMore> get copyWith => _$HistoryLoadingMoreCopyWithImpl<HistoryLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryLoadingMore&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total);

@override
String toString() {
  return 'HistoryState.loadingMore(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class $HistoryLoadingMoreCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryLoadingMoreCopyWith(HistoryLoadingMore value, $Res Function(HistoryLoadingMore) _then) = _$HistoryLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<HistoryItem> items, int total
});




}
/// @nodoc
class _$HistoryLoadingMoreCopyWithImpl<$Res>
    implements $HistoryLoadingMoreCopyWith<$Res> {
  _$HistoryLoadingMoreCopyWithImpl(this._self, this._then);

  final HistoryLoadingMore _self;
  final $Res Function(HistoryLoadingMore) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,}) {
  return _then(HistoryLoadingMore(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class HistoryLoadMoreFailure implements HistoryState {
  const HistoryLoadMoreFailure({required final  List<HistoryItem> items, required this.total, required this.message}): _items = items;
  

 final  List<HistoryItem> _items;
 List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  int total;
 final  String message;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryLoadMoreFailureCopyWith<HistoryLoadMoreFailure> get copyWith => _$HistoryLoadMoreFailureCopyWithImpl<HistoryLoadMoreFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryLoadMoreFailure&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,message);

@override
String toString() {
  return 'HistoryState.loadMoreFailure(items: $items, total: $total, message: $message)';
}


}

/// @nodoc
abstract mixin class $HistoryLoadMoreFailureCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryLoadMoreFailureCopyWith(HistoryLoadMoreFailure value, $Res Function(HistoryLoadMoreFailure) _then) = _$HistoryLoadMoreFailureCopyWithImpl;
@useResult
$Res call({
 List<HistoryItem> items, int total, String message
});




}
/// @nodoc
class _$HistoryLoadMoreFailureCopyWithImpl<$Res>
    implements $HistoryLoadMoreFailureCopyWith<$Res> {
  _$HistoryLoadMoreFailureCopyWithImpl(this._self, this._then);

  final HistoryLoadMoreFailure _self;
  final $Res Function(HistoryLoadMoreFailure) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? message = null,}) {
  return _then(HistoryLoadMoreFailure(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HistoryFailure implements HistoryState {
  const HistoryFailure({required this.message});
  

 final  String message;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryFailureCopyWith<HistoryFailure> get copyWith => _$HistoryFailureCopyWithImpl<HistoryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HistoryState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $HistoryFailureCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryFailureCopyWith(HistoryFailure value, $Res Function(HistoryFailure) _then) = _$HistoryFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HistoryFailureCopyWithImpl<$Res>
    implements $HistoryFailureCopyWith<$Res> {
  _$HistoryFailureCopyWithImpl(this._self, this._then);

  final HistoryFailure _self;
  final $Res Function(HistoryFailure) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HistoryFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
