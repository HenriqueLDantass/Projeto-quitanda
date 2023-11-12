// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel user) sucess,
    required TResult Function(String mensagem) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel user)? sucess,
    TResult? Function(String mensagem)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel user)? sucess,
    TResult Function(String mensagem)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sucess value) sucess,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(sucess value)? sucess,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sucess value)? sucess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
          AuthResult value, $Res Function(AuthResult) then) =
      _$AuthResultCopyWithImpl<$Res, AuthResult>;
}

/// @nodoc
class _$AuthResultCopyWithImpl<$Res, $Val extends AuthResult>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$sucessImplCopyWith<$Res> {
  factory _$$sucessImplCopyWith(
          _$sucessImpl value, $Res Function(_$sucessImpl) then) =
      __$$sucessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileModel user});
}

/// @nodoc
class __$$sucessImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$sucessImpl>
    implements _$$sucessImplCopyWith<$Res> {
  __$$sucessImplCopyWithImpl(
      _$sucessImpl _value, $Res Function(_$sucessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$sucessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

class _$sucessImpl implements sucess {
  _$sucessImpl(this.user);

  @override
  final ProfileModel user;

  @override
  String toString() {
    return 'AuthResult.sucess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$sucessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$sucessImplCopyWith<_$sucessImpl> get copyWith =>
      __$$sucessImplCopyWithImpl<_$sucessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel user) sucess,
    required TResult Function(String mensagem) error,
  }) {
    return sucess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel user)? sucess,
    TResult? Function(String mensagem)? error,
  }) {
    return sucess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel user)? sucess,
    TResult Function(String mensagem)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sucess value) sucess,
    required TResult Function(Error value) error,
  }) {
    return sucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(sucess value)? sucess,
    TResult? Function(Error value)? error,
  }) {
    return sucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sucess value)? sucess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(this);
    }
    return orElse();
  }
}

abstract class sucess implements AuthResult {
  factory sucess(final ProfileModel user) = _$sucessImpl;

  ProfileModel get user;
  @JsonKey(ignore: true)
  _$$sucessImplCopyWith<_$sucessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mensagem});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mensagem = null,
  }) {
    return _then(_$ErrorImpl(
      null == mensagem
          ? _value.mensagem
          : mensagem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  _$ErrorImpl(this.mensagem);

  @override
  final String mensagem;

  @override
  String toString() {
    return 'AuthResult.error(mensagem: $mensagem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.mensagem, mensagem) ||
                other.mensagem == mensagem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mensagem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProfileModel user) sucess,
    required TResult Function(String mensagem) error,
  }) {
    return error(mensagem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProfileModel user)? sucess,
    TResult? Function(String mensagem)? error,
  }) {
    return error?.call(mensagem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProfileModel user)? sucess,
    TResult Function(String mensagem)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(mensagem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(sucess value) sucess,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(sucess value)? sucess,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(sucess value)? sucess,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthResult {
  factory Error(final String mensagem) = _$ErrorImpl;

  String get mensagem;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
