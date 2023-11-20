// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_localization_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLocalizationState {
  AppLocale get appLocale => throw _privateConstructorUsedError;
  Key get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLocalizationStateCopyWith<AppLocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocalizationStateCopyWith<$Res> {
  factory $AppLocalizationStateCopyWith(AppLocalizationState value,
          $Res Function(AppLocalizationState) then) =
      _$AppLocalizationStateCopyWithImpl<$Res, AppLocalizationState>;
  @useResult
  $Res call({AppLocale appLocale, Key key});
}

/// @nodoc
class _$AppLocalizationStateCopyWithImpl<$Res,
        $Val extends AppLocalizationState>
    implements $AppLocalizationStateCopyWith<$Res> {
  _$AppLocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appLocale = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLocalizationStateImplCopyWith<$Res>
    implements $AppLocalizationStateCopyWith<$Res> {
  factory _$$AppLocalizationStateImplCopyWith(_$AppLocalizationStateImpl value,
          $Res Function(_$AppLocalizationStateImpl) then) =
      __$$AppLocalizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppLocale appLocale, Key key});
}

/// @nodoc
class __$$AppLocalizationStateImplCopyWithImpl<$Res>
    extends _$AppLocalizationStateCopyWithImpl<$Res, _$AppLocalizationStateImpl>
    implements _$$AppLocalizationStateImplCopyWith<$Res> {
  __$$AppLocalizationStateImplCopyWithImpl(_$AppLocalizationStateImpl _value,
      $Res Function(_$AppLocalizationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appLocale = null,
    Object? key = null,
  }) {
    return _then(_$AppLocalizationStateImpl(
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$AppLocalizationStateImpl implements _AppLocalizationState {
  const _$AppLocalizationStateImpl(
      {required this.appLocale, required this.key});

  @override
  final AppLocale appLocale;
  @override
  final Key key;

  @override
  String toString() {
    return 'AppLocalizationState(appLocale: $appLocale, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLocalizationStateImpl &&
            (identical(other.appLocale, appLocale) ||
                other.appLocale == appLocale) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appLocale, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLocalizationStateImplCopyWith<_$AppLocalizationStateImpl>
      get copyWith =>
          __$$AppLocalizationStateImplCopyWithImpl<_$AppLocalizationStateImpl>(
              this, _$identity);
}

abstract class _AppLocalizationState implements AppLocalizationState {
  const factory _AppLocalizationState(
      {required final AppLocale appLocale,
      required final Key key}) = _$AppLocalizationStateImpl;

  @override
  AppLocale get appLocale;
  @override
  Key get key;
  @override
  @JsonKey(ignore: true)
  _$$AppLocalizationStateImplCopyWith<_$AppLocalizationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
