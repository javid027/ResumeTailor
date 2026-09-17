// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryPage {

 List<HistoryItem> get items; int get page; int get limit; int get total;
/// Create a copy of HistoryPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryPageCopyWith<HistoryPage> get copyWith => _$HistoryPageCopyWithImpl<HistoryPage>(this as HistoryPage, _$identity);

  /// Serializes this HistoryPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryPage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,limit,total);

@override
String toString() {
  return 'HistoryPage(items: $items, page: $page, limit: $limit, total: $total)';
}


}

/// @nodoc
abstract mixin class $HistoryPageCopyWith<$Res>  {
  factory $HistoryPageCopyWith(HistoryPage value, $Res Function(HistoryPage) _then) = _$HistoryPageCopyWithImpl;
@useResult
$Res call({
 List<HistoryItem> items, int page, int limit, int total
});




}
/// @nodoc
class _$HistoryPageCopyWithImpl<$Res>
    implements $HistoryPageCopyWith<$Res> {
  _$HistoryPageCopyWithImpl(this._self, this._then);

  final HistoryPage _self;
  final $Res Function(HistoryPage) _then;

/// Create a copy of HistoryPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? limit = null,Object? total = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryPage].
extension HistoryPagePatterns on HistoryPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryPage value)  $default,){
final _that = this;
switch (_that) {
case _HistoryPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryPage value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryItem> items,  int page,  int limit,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryPage() when $default != null:
return $default(_that.items,_that.page,_that.limit,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryItem> items,  int page,  int limit,  int total)  $default,) {final _that = this;
switch (_that) {
case _HistoryPage():
return $default(_that.items,_that.page,_that.limit,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryItem> items,  int page,  int limit,  int total)?  $default,) {final _that = this;
switch (_that) {
case _HistoryPage() when $default != null:
return $default(_that.items,_that.page,_that.limit,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryPage implements HistoryPage {
  const _HistoryPage({required final  List<HistoryItem> items, required this.page, required this.limit, required this.total}): _items = items;
  factory _HistoryPage.fromJson(Map<String, dynamic> json) => _$HistoryPageFromJson(json);

 final  List<HistoryItem> _items;
@override List<HistoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int page;
@override final  int limit;
@override final  int total;

/// Create a copy of HistoryPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryPageCopyWith<_HistoryPage> get copyWith => __$HistoryPageCopyWithImpl<_HistoryPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryPage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,limit,total);

@override
String toString() {
  return 'HistoryPage(items: $items, page: $page, limit: $limit, total: $total)';
}


}

/// @nodoc
abstract mixin class _$HistoryPageCopyWith<$Res> implements $HistoryPageCopyWith<$Res> {
  factory _$HistoryPageCopyWith(_HistoryPage value, $Res Function(_HistoryPage) _then) = __$HistoryPageCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryItem> items, int page, int limit, int total
});




}
/// @nodoc
class __$HistoryPageCopyWithImpl<$Res>
    implements _$HistoryPageCopyWith<$Res> {
  __$HistoryPageCopyWithImpl(this._self, this._then);

  final _HistoryPage _self;
  final $Res Function(_HistoryPage) _then;

/// Create a copy of HistoryPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? limit = null,Object? total = null,}) {
  return _then(_HistoryPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
