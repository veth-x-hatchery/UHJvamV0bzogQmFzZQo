import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

part 'user_entity.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required EmailAddress credential,
    required String name,
  }) = _User;
}
