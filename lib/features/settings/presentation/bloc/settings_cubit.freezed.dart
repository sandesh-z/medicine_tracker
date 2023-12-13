// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get switchState => throw _privateConstructorUsedError;
  int get validDiff => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  ValidTime get validTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool switchState,
      int validDiff,
      Settings settings,
      ValidTime validTime});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? switchState = null,
    Object? validDiff = null,
    Object? settings = null,
    Object? validTime = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      switchState: null == switchState
          ? _value.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as bool,
      validDiff: null == validDiff
          ? _value.validDiff
          : validDiff // ignore: cast_nullable_to_non_nullable
              as int,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      validTime: null == validTime
          ? _value.validTime
          : validTime // ignore: cast_nullable_to_non_nullable
              as ValidTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool switchState,
      int validDiff,
      Settings settings,
      ValidTime validTime});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? switchState = null,
    Object? validDiff = null,
    Object? settings = null,
    Object? validTime = null,
  }) {
    return _then(_$SettingsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      switchState: null == switchState
          ? _value.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as bool,
      validDiff: null == validDiff
          ? _value.validDiff
          : validDiff // ignore: cast_nullable_to_non_nullable
              as int,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      validTime: null == validTime
          ? _value.validTime
          : validTime // ignore: cast_nullable_to_non_nullable
              as ValidTime,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {required this.isLoading,
      required this.switchState,
      required this.validDiff,
      required this.settings,
      required this.validTime});

  @override
  final bool isLoading;
  @override
  final bool switchState;
  @override
  final int validDiff;
  @override
  final Settings settings;
  @override
  final ValidTime validTime;

  @override
  String toString() {
    return 'SettingsState(isLoading: $isLoading, switchState: $switchState, validDiff: $validDiff, settings: $settings, validTime: $validTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.switchState, switchState) ||
                other.switchState == switchState) &&
            (identical(other.validDiff, validDiff) ||
                other.validDiff == validDiff) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.validTime, validTime) ||
                other.validTime == validTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, switchState, validDiff, settings, validTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final bool isLoading,
      required final bool switchState,
      required final int validDiff,
      required final Settings settings,
      required final ValidTime validTime}) = _$SettingsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get switchState;
  @override
  int get validDiff;
  @override
  Settings get settings;
  @override
  ValidTime get validTime;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
