// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangePasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordState()';
}


}

/// @nodoc
class $ChangePasswordStateCopyWith<$Res>  {
$ChangePasswordStateCopyWith(ChangePasswordState _, $Res Function(ChangePasswordState) __);
}


/// Adds pattern-matching-related methods to [ChangePasswordState].
extension ChangePasswordStatePatterns on ChangePasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ChangePasswordLoading value)?  loading,TResult Function( ChangePasswordSuccess value)?  success,TResult Function( ChangePasswordError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangePasswordLoading() when loading != null:
return loading(_that);case ChangePasswordSuccess() when success != null:
return success(_that);case ChangePasswordError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ChangePasswordLoading value)  loading,required TResult Function( ChangePasswordSuccess value)  success,required TResult Function( ChangePasswordError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ChangePasswordLoading():
return loading(_that);case ChangePasswordSuccess():
return success(_that);case ChangePasswordError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ChangePasswordLoading value)?  loading,TResult? Function( ChangePasswordSuccess value)?  success,TResult? Function( ChangePasswordError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangePasswordLoading() when loading != null:
return loading(_that);case ChangePasswordSuccess() when success != null:
return success(_that);case ChangePasswordError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangePasswordLoading() when loading != null:
return loading();case ChangePasswordSuccess() when success != null:
return success(_that.message);case ChangePasswordError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ChangePasswordLoading():
return loading();case ChangePasswordSuccess():
return success(_that.message);case ChangePasswordError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangePasswordLoading() when loading != null:
return loading();case ChangePasswordSuccess() when success != null:
return success(_that.message);case ChangePasswordError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ChangePasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordState.initial()';
}


}




/// @nodoc


class ChangePasswordLoading implements ChangePasswordState {
  const ChangePasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangePasswordState.loading()';
}


}




/// @nodoc


class ChangePasswordSuccess implements ChangePasswordState {
  const ChangePasswordSuccess(this.message);
  

 final  String message;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordSuccessCopyWith<ChangePasswordSuccess> get copyWith => _$ChangePasswordSuccessCopyWithImpl<ChangePasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChangePasswordState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordSuccessCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordSuccessCopyWith(ChangePasswordSuccess value, $Res Function(ChangePasswordSuccess) _then) = _$ChangePasswordSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChangePasswordSuccessCopyWithImpl<$Res>
    implements $ChangePasswordSuccessCopyWith<$Res> {
  _$ChangePasswordSuccessCopyWithImpl(this._self, this._then);

  final ChangePasswordSuccess _self;
  final $Res Function(ChangePasswordSuccess) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChangePasswordSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangePasswordError implements ChangePasswordState {
  const ChangePasswordError(this.message);
  

 final  String message;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordErrorCopyWith<ChangePasswordError> get copyWith => _$ChangePasswordErrorCopyWithImpl<ChangePasswordError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChangePasswordState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordErrorCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordErrorCopyWith(ChangePasswordError value, $Res Function(ChangePasswordError) _then) = _$ChangePasswordErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChangePasswordErrorCopyWithImpl<$Res>
    implements $ChangePasswordErrorCopyWith<$Res> {
  _$ChangePasswordErrorCopyWithImpl(this._self, this._then);

  final ChangePasswordError _self;
  final $Res Function(ChangePasswordError) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChangePasswordError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
