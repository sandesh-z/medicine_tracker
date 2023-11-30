// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_medicine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddMedicineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MedicineDetails medicineDetails) save,
    required TResult Function(int id, String value) update,
    required TResult Function() getAllMedicine,
    required TResult Function(int medicineFrequency)
        changeMedicineTimeFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MedicineDetails medicineDetails)? save,
    TResult? Function(int id, String value)? update,
    TResult? Function()? getAllMedicine,
    TResult? Function(int medicineFrequency)? changeMedicineTimeFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MedicineDetails medicineDetails)? save,
    TResult Function(int id, String value)? update,
    TResult Function()? getAllMedicine,
    TResult Function(int medicineFrequency)? changeMedicineTimeFrequency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveMedicineDetail value) save,
    required TResult Function(_UpdateMedicineDetail value) update,
    required TResult Function(_GetAllMedicine value) getAllMedicine,
    required TResult Function(_ChangeMedicineTimeFrequency value)
        changeMedicineTimeFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveMedicineDetail value)? save,
    TResult? Function(_UpdateMedicineDetail value)? update,
    TResult? Function(_GetAllMedicine value)? getAllMedicine,
    TResult? Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveMedicineDetail value)? save,
    TResult Function(_UpdateMedicineDetail value)? update,
    TResult Function(_GetAllMedicine value)? getAllMedicine,
    TResult Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMedicineEventCopyWith<$Res> {
  factory $AddMedicineEventCopyWith(
          AddMedicineEvent value, $Res Function(AddMedicineEvent) then) =
      _$AddMedicineEventCopyWithImpl<$Res, AddMedicineEvent>;
}

/// @nodoc
class _$AddMedicineEventCopyWithImpl<$Res, $Val extends AddMedicineEvent>
    implements $AddMedicineEventCopyWith<$Res> {
  _$AddMedicineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SaveMedicineDetailImplCopyWith<$Res> {
  factory _$$SaveMedicineDetailImplCopyWith(_$SaveMedicineDetailImpl value,
          $Res Function(_$SaveMedicineDetailImpl) then) =
      __$$SaveMedicineDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicineDetails medicineDetails});
}

/// @nodoc
class __$$SaveMedicineDetailImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$SaveMedicineDetailImpl>
    implements _$$SaveMedicineDetailImplCopyWith<$Res> {
  __$$SaveMedicineDetailImplCopyWithImpl(_$SaveMedicineDetailImpl _value,
      $Res Function(_$SaveMedicineDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicineDetails = null,
  }) {
    return _then(_$SaveMedicineDetailImpl(
      null == medicineDetails
          ? _value.medicineDetails
          : medicineDetails // ignore: cast_nullable_to_non_nullable
              as MedicineDetails,
    ));
  }
}

/// @nodoc

class _$SaveMedicineDetailImpl implements _SaveMedicineDetail {
  const _$SaveMedicineDetailImpl(this.medicineDetails);

  @override
  final MedicineDetails medicineDetails;

  @override
  String toString() {
    return 'AddMedicineEvent.save(medicineDetails: $medicineDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveMedicineDetailImpl &&
            (identical(other.medicineDetails, medicineDetails) ||
                other.medicineDetails == medicineDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicineDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveMedicineDetailImplCopyWith<_$SaveMedicineDetailImpl> get copyWith =>
      __$$SaveMedicineDetailImplCopyWithImpl<_$SaveMedicineDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MedicineDetails medicineDetails) save,
    required TResult Function(int id, String value) update,
    required TResult Function() getAllMedicine,
    required TResult Function(int medicineFrequency)
        changeMedicineTimeFrequency,
  }) {
    return save(medicineDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MedicineDetails medicineDetails)? save,
    TResult? Function(int id, String value)? update,
    TResult? Function()? getAllMedicine,
    TResult? Function(int medicineFrequency)? changeMedicineTimeFrequency,
  }) {
    return save?.call(medicineDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MedicineDetails medicineDetails)? save,
    TResult Function(int id, String value)? update,
    TResult Function()? getAllMedicine,
    TResult Function(int medicineFrequency)? changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(medicineDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveMedicineDetail value) save,
    required TResult Function(_UpdateMedicineDetail value) update,
    required TResult Function(_GetAllMedicine value) getAllMedicine,
    required TResult Function(_ChangeMedicineTimeFrequency value)
        changeMedicineTimeFrequency,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveMedicineDetail value)? save,
    TResult? Function(_UpdateMedicineDetail value)? update,
    TResult? Function(_GetAllMedicine value)? getAllMedicine,
    TResult? Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveMedicineDetail value)? save,
    TResult Function(_UpdateMedicineDetail value)? update,
    TResult Function(_GetAllMedicine value)? getAllMedicine,
    TResult Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _SaveMedicineDetail implements AddMedicineEvent {
  const factory _SaveMedicineDetail(final MedicineDetails medicineDetails) =
      _$SaveMedicineDetailImpl;

  MedicineDetails get medicineDetails;
  @JsonKey(ignore: true)
  _$$SaveMedicineDetailImplCopyWith<_$SaveMedicineDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMedicineDetailImplCopyWith<$Res> {
  factory _$$UpdateMedicineDetailImplCopyWith(_$UpdateMedicineDetailImpl value,
          $Res Function(_$UpdateMedicineDetailImpl) then) =
      __$$UpdateMedicineDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String value});
}

/// @nodoc
class __$$UpdateMedicineDetailImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$UpdateMedicineDetailImpl>
    implements _$$UpdateMedicineDetailImplCopyWith<$Res> {
  __$$UpdateMedicineDetailImplCopyWithImpl(_$UpdateMedicineDetailImpl _value,
      $Res Function(_$UpdateMedicineDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
  }) {
    return _then(_$UpdateMedicineDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateMedicineDetailImpl implements _UpdateMedicineDetail {
  const _$UpdateMedicineDetailImpl(this.id, this.value);

  @override
  final int id;
  @override
  final String value;

  @override
  String toString() {
    return 'AddMedicineEvent.update(id: $id, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMedicineDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMedicineDetailImplCopyWith<_$UpdateMedicineDetailImpl>
      get copyWith =>
          __$$UpdateMedicineDetailImplCopyWithImpl<_$UpdateMedicineDetailImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MedicineDetails medicineDetails) save,
    required TResult Function(int id, String value) update,
    required TResult Function() getAllMedicine,
    required TResult Function(int medicineFrequency)
        changeMedicineTimeFrequency,
  }) {
    return update(id, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MedicineDetails medicineDetails)? save,
    TResult? Function(int id, String value)? update,
    TResult? Function()? getAllMedicine,
    TResult? Function(int medicineFrequency)? changeMedicineTimeFrequency,
  }) {
    return update?.call(id, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MedicineDetails medicineDetails)? save,
    TResult Function(int id, String value)? update,
    TResult Function()? getAllMedicine,
    TResult Function(int medicineFrequency)? changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveMedicineDetail value) save,
    required TResult Function(_UpdateMedicineDetail value) update,
    required TResult Function(_GetAllMedicine value) getAllMedicine,
    required TResult Function(_ChangeMedicineTimeFrequency value)
        changeMedicineTimeFrequency,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveMedicineDetail value)? save,
    TResult? Function(_UpdateMedicineDetail value)? update,
    TResult? Function(_GetAllMedicine value)? getAllMedicine,
    TResult? Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveMedicineDetail value)? save,
    TResult Function(_UpdateMedicineDetail value)? update,
    TResult Function(_GetAllMedicine value)? getAllMedicine,
    TResult Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateMedicineDetail implements AddMedicineEvent {
  const factory _UpdateMedicineDetail(final int id, final String value) =
      _$UpdateMedicineDetailImpl;

  int get id;
  String get value;
  @JsonKey(ignore: true)
  _$$UpdateMedicineDetailImplCopyWith<_$UpdateMedicineDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllMedicineImplCopyWith<$Res> {
  factory _$$GetAllMedicineImplCopyWith(_$GetAllMedicineImpl value,
          $Res Function(_$GetAllMedicineImpl) then) =
      __$$GetAllMedicineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllMedicineImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res, _$GetAllMedicineImpl>
    implements _$$GetAllMedicineImplCopyWith<$Res> {
  __$$GetAllMedicineImplCopyWithImpl(
      _$GetAllMedicineImpl _value, $Res Function(_$GetAllMedicineImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllMedicineImpl implements _GetAllMedicine {
  const _$GetAllMedicineImpl();

  @override
  String toString() {
    return 'AddMedicineEvent.getAllMedicine()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllMedicineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MedicineDetails medicineDetails) save,
    required TResult Function(int id, String value) update,
    required TResult Function() getAllMedicine,
    required TResult Function(int medicineFrequency)
        changeMedicineTimeFrequency,
  }) {
    return getAllMedicine();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MedicineDetails medicineDetails)? save,
    TResult? Function(int id, String value)? update,
    TResult? Function()? getAllMedicine,
    TResult? Function(int medicineFrequency)? changeMedicineTimeFrequency,
  }) {
    return getAllMedicine?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MedicineDetails medicineDetails)? save,
    TResult Function(int id, String value)? update,
    TResult Function()? getAllMedicine,
    TResult Function(int medicineFrequency)? changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (getAllMedicine != null) {
      return getAllMedicine();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveMedicineDetail value) save,
    required TResult Function(_UpdateMedicineDetail value) update,
    required TResult Function(_GetAllMedicine value) getAllMedicine,
    required TResult Function(_ChangeMedicineTimeFrequency value)
        changeMedicineTimeFrequency,
  }) {
    return getAllMedicine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveMedicineDetail value)? save,
    TResult? Function(_UpdateMedicineDetail value)? update,
    TResult? Function(_GetAllMedicine value)? getAllMedicine,
    TResult? Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
  }) {
    return getAllMedicine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveMedicineDetail value)? save,
    TResult Function(_UpdateMedicineDetail value)? update,
    TResult Function(_GetAllMedicine value)? getAllMedicine,
    TResult Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (getAllMedicine != null) {
      return getAllMedicine(this);
    }
    return orElse();
  }
}

abstract class _GetAllMedicine implements AddMedicineEvent {
  const factory _GetAllMedicine() = _$GetAllMedicineImpl;
}

/// @nodoc
abstract class _$$ChangeMedicineTimeFrequencyImplCopyWith<$Res> {
  factory _$$ChangeMedicineTimeFrequencyImplCopyWith(
          _$ChangeMedicineTimeFrequencyImpl value,
          $Res Function(_$ChangeMedicineTimeFrequencyImpl) then) =
      __$$ChangeMedicineTimeFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int medicineFrequency});
}

/// @nodoc
class __$$ChangeMedicineTimeFrequencyImplCopyWithImpl<$Res>
    extends _$AddMedicineEventCopyWithImpl<$Res,
        _$ChangeMedicineTimeFrequencyImpl>
    implements _$$ChangeMedicineTimeFrequencyImplCopyWith<$Res> {
  __$$ChangeMedicineTimeFrequencyImplCopyWithImpl(
      _$ChangeMedicineTimeFrequencyImpl _value,
      $Res Function(_$ChangeMedicineTimeFrequencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicineFrequency = null,
  }) {
    return _then(_$ChangeMedicineTimeFrequencyImpl(
      null == medicineFrequency
          ? _value.medicineFrequency
          : medicineFrequency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeMedicineTimeFrequencyImpl
    implements _ChangeMedicineTimeFrequency {
  const _$ChangeMedicineTimeFrequencyImpl(this.medicineFrequency);

  @override
  final int medicineFrequency;

  @override
  String toString() {
    return 'AddMedicineEvent.changeMedicineTimeFrequency(medicineFrequency: $medicineFrequency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeMedicineTimeFrequencyImpl &&
            (identical(other.medicineFrequency, medicineFrequency) ||
                other.medicineFrequency == medicineFrequency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicineFrequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeMedicineTimeFrequencyImplCopyWith<_$ChangeMedicineTimeFrequencyImpl>
      get copyWith => __$$ChangeMedicineTimeFrequencyImplCopyWithImpl<
          _$ChangeMedicineTimeFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MedicineDetails medicineDetails) save,
    required TResult Function(int id, String value) update,
    required TResult Function() getAllMedicine,
    required TResult Function(int medicineFrequency)
        changeMedicineTimeFrequency,
  }) {
    return changeMedicineTimeFrequency(medicineFrequency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MedicineDetails medicineDetails)? save,
    TResult? Function(int id, String value)? update,
    TResult? Function()? getAllMedicine,
    TResult? Function(int medicineFrequency)? changeMedicineTimeFrequency,
  }) {
    return changeMedicineTimeFrequency?.call(medicineFrequency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MedicineDetails medicineDetails)? save,
    TResult Function(int id, String value)? update,
    TResult Function()? getAllMedicine,
    TResult Function(int medicineFrequency)? changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (changeMedicineTimeFrequency != null) {
      return changeMedicineTimeFrequency(medicineFrequency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveMedicineDetail value) save,
    required TResult Function(_UpdateMedicineDetail value) update,
    required TResult Function(_GetAllMedicine value) getAllMedicine,
    required TResult Function(_ChangeMedicineTimeFrequency value)
        changeMedicineTimeFrequency,
  }) {
    return changeMedicineTimeFrequency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveMedicineDetail value)? save,
    TResult? Function(_UpdateMedicineDetail value)? update,
    TResult? Function(_GetAllMedicine value)? getAllMedicine,
    TResult? Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
  }) {
    return changeMedicineTimeFrequency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveMedicineDetail value)? save,
    TResult Function(_UpdateMedicineDetail value)? update,
    TResult Function(_GetAllMedicine value)? getAllMedicine,
    TResult Function(_ChangeMedicineTimeFrequency value)?
        changeMedicineTimeFrequency,
    required TResult orElse(),
  }) {
    if (changeMedicineTimeFrequency != null) {
      return changeMedicineTimeFrequency(this);
    }
    return orElse();
  }
}

abstract class _ChangeMedicineTimeFrequency implements AddMedicineEvent {
  const factory _ChangeMedicineTimeFrequency(final int medicineFrequency) =
      _$ChangeMedicineTimeFrequencyImpl;

  int get medicineFrequency;
  @JsonKey(ignore: true)
  _$$ChangeMedicineTimeFrequencyImplCopyWith<_$ChangeMedicineTimeFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddMedicineState {
  Key get key => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get medicineFrequency => throw _privateConstructorUsedError;
  List<MedicineDetails>? get allMedicineList =>
      throw _privateConstructorUsedError;
  List<String> get schedules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMedicineStateCopyWith<AddMedicineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMedicineStateCopyWith<$Res> {
  factory $AddMedicineStateCopyWith(
          AddMedicineState value, $Res Function(AddMedicineState) then) =
      _$AddMedicineStateCopyWithImpl<$Res, AddMedicineState>;
  @useResult
  $Res call(
      {Key key,
      bool isLoading,
      int medicineFrequency,
      List<MedicineDetails>? allMedicineList,
      List<String> schedules});
}

/// @nodoc
class _$AddMedicineStateCopyWithImpl<$Res, $Val extends AddMedicineState>
    implements $AddMedicineStateCopyWith<$Res> {
  _$AddMedicineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? isLoading = null,
    Object? medicineFrequency = null,
    Object? allMedicineList = freezed,
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      medicineFrequency: null == medicineFrequency
          ? _value.medicineFrequency
          : medicineFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      allMedicineList: freezed == allMedicineList
          ? _value.allMedicineList
          : allMedicineList // ignore: cast_nullable_to_non_nullable
              as List<MedicineDetails>?,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMedicineStateImplCopyWith<$Res>
    implements $AddMedicineStateCopyWith<$Res> {
  factory _$$AddMedicineStateImplCopyWith(_$AddMedicineStateImpl value,
          $Res Function(_$AddMedicineStateImpl) then) =
      __$$AddMedicineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Key key,
      bool isLoading,
      int medicineFrequency,
      List<MedicineDetails>? allMedicineList,
      List<String> schedules});
}

/// @nodoc
class __$$AddMedicineStateImplCopyWithImpl<$Res>
    extends _$AddMedicineStateCopyWithImpl<$Res, _$AddMedicineStateImpl>
    implements _$$AddMedicineStateImplCopyWith<$Res> {
  __$$AddMedicineStateImplCopyWithImpl(_$AddMedicineStateImpl _value,
      $Res Function(_$AddMedicineStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? isLoading = null,
    Object? medicineFrequency = null,
    Object? allMedicineList = freezed,
    Object? schedules = null,
  }) {
    return _then(_$AddMedicineStateImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      medicineFrequency: null == medicineFrequency
          ? _value.medicineFrequency
          : medicineFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      allMedicineList: freezed == allMedicineList
          ? _value._allMedicineList
          : allMedicineList // ignore: cast_nullable_to_non_nullable
              as List<MedicineDetails>?,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddMedicineStateImpl implements _AddMedicineState {
  const _$AddMedicineStateImpl(
      {required this.key,
      required this.isLoading,
      required this.medicineFrequency,
      required final List<MedicineDetails>? allMedicineList,
      required final List<String> schedules})
      : _allMedicineList = allMedicineList,
        _schedules = schedules;

  @override
  final Key key;
  @override
  final bool isLoading;
  @override
  final int medicineFrequency;
  final List<MedicineDetails>? _allMedicineList;
  @override
  List<MedicineDetails>? get allMedicineList {
    final value = _allMedicineList;
    if (value == null) return null;
    if (_allMedicineList is EqualUnmodifiableListView) return _allMedicineList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _schedules;
  @override
  List<String> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'AddMedicineState(key: $key, isLoading: $isLoading, medicineFrequency: $medicineFrequency, allMedicineList: $allMedicineList, schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMedicineStateImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.medicineFrequency, medicineFrequency) ||
                other.medicineFrequency == medicineFrequency) &&
            const DeepCollectionEquality()
                .equals(other._allMedicineList, _allMedicineList) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      isLoading,
      medicineFrequency,
      const DeepCollectionEquality().hash(_allMedicineList),
      const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMedicineStateImplCopyWith<_$AddMedicineStateImpl> get copyWith =>
      __$$AddMedicineStateImplCopyWithImpl<_$AddMedicineStateImpl>(
          this, _$identity);
}

abstract class _AddMedicineState implements AddMedicineState {
  const factory _AddMedicineState(
      {required final Key key,
      required final bool isLoading,
      required final int medicineFrequency,
      required final List<MedicineDetails>? allMedicineList,
      required final List<String> schedules}) = _$AddMedicineStateImpl;

  @override
  Key get key;
  @override
  bool get isLoading;
  @override
  int get medicineFrequency;
  @override
  List<MedicineDetails>? get allMedicineList;
  @override
  List<String> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$AddMedicineStateImplCopyWith<_$AddMedicineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
