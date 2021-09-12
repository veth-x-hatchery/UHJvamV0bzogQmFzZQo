import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// TODO(v): change failedValue to failureReason
@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidCredential({
    required T failedValue,
  }) = InvalidCredential<T>;
  const factory ValueFailure.shortSecret({
    required T failedValue,
  }) = ShortSecret<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
}
