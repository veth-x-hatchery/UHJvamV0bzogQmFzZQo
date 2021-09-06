import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_auth_failure.freezed.dart';

@freezed
abstract class LocalAuthFailure with _$LocalAuthFailure {
  const factory LocalAuthFailure.genericError() = GenericError;
  const factory LocalAuthFailure.notAvailable() = NotAvailable;
}
