import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.serverError({required String message}) =
      _ServerError;
}
