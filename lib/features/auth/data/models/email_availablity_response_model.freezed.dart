// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_availablity_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailAvailablityResponseModel {

 bool get isAvailable;
/// Create a copy of EmailAvailablityResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailAvailablityResponseModelCopyWith<EmailAvailablityResponseModel> get copyWith => _$EmailAvailablityResponseModelCopyWithImpl<EmailAvailablityResponseModel>(this as EmailAvailablityResponseModel, _$identity);

  /// Serializes this EmailAvailablityResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailAvailablityResponseModel&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAvailable);

@override
String toString() {
  return 'EmailAvailablityResponseModel(isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $EmailAvailablityResponseModelCopyWith<$Res>  {
  factory $EmailAvailablityResponseModelCopyWith(EmailAvailablityResponseModel value, $Res Function(EmailAvailablityResponseModel) _then) = _$EmailAvailablityResponseModelCopyWithImpl;
@useResult
$Res call({
 bool isAvailable
});




}
/// @nodoc
class _$EmailAvailablityResponseModelCopyWithImpl<$Res>
    implements $EmailAvailablityResponseModelCopyWith<$Res> {
  _$EmailAvailablityResponseModelCopyWithImpl(this._self, this._then);

  final EmailAvailablityResponseModel _self;
  final $Res Function(EmailAvailablityResponseModel) _then;

/// Create a copy of EmailAvailablityResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAvailable = null,}) {
  return _then(_self.copyWith(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailAvailablityResponseModel].
extension EmailAvailablityResponseModelPatterns on EmailAvailablityResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailAvailablityResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailAvailablityResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailAvailablityResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel() when $default != null:
return $default(_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel():
return $default(_that.isAvailable);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _EmailAvailablityResponseModel() when $default != null:
return $default(_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailAvailablityResponseModel extends EmailAvailablityResponseModel {
  const _EmailAvailablityResponseModel({required this.isAvailable}): super._();
  factory _EmailAvailablityResponseModel.fromJson(Map<String, dynamic> json) => _$EmailAvailablityResponseModelFromJson(json);

@override final  bool isAvailable;

/// Create a copy of EmailAvailablityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailAvailablityResponseModelCopyWith<_EmailAvailablityResponseModel> get copyWith => __$EmailAvailablityResponseModelCopyWithImpl<_EmailAvailablityResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailAvailablityResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAvailablityResponseModel&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAvailable);

@override
String toString() {
  return 'EmailAvailablityResponseModel(isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$EmailAvailablityResponseModelCopyWith<$Res> implements $EmailAvailablityResponseModelCopyWith<$Res> {
  factory _$EmailAvailablityResponseModelCopyWith(_EmailAvailablityResponseModel value, $Res Function(_EmailAvailablityResponseModel) _then) = __$EmailAvailablityResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool isAvailable
});




}
/// @nodoc
class __$EmailAvailablityResponseModelCopyWithImpl<$Res>
    implements _$EmailAvailablityResponseModelCopyWith<$Res> {
  __$EmailAvailablityResponseModelCopyWithImpl(this._self, this._then);

  final _EmailAvailablityResponseModel _self;
  final $Res Function(_EmailAvailablityResponseModel) _then;

/// Create a copy of EmailAvailablityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAvailable = null,}) {
  return _then(_EmailAvailablityResponseModel(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
