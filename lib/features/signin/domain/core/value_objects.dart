import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:vethx_beta/features/signin/domain/core/errors.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';

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

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
