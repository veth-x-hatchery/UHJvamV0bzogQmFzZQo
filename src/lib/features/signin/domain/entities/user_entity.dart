import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';

part 'user_entity.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required Credential credential,
    required String name,
  }) = _User;
}
