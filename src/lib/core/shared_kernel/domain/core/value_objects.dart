import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throw [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (rigth) => right
    return value.fold(
        (valueFailure) => throw UnexpectedValueError(valueFailure), id);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  bool isValid() => value.isRight();

  T? get inputedValue => value.fold(
        (l) => l.failedValue,
        (r) => r,
      );

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
