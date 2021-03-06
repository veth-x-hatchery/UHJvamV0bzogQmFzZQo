import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: depend_on_referenced_packages
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

/// Actualy this type, closure, has no hash based on function received body
/// This means that is not possible compare same values
/// [MessageFromLocalizationsX] has a workaround to deal with it
///
/// When declaring a type [MessageFromLocalizations] need to return ?? '[var_name]'
///
///   MessageFromLocalizations message() => (appLocalizations) =>
///   appLocalizations?.[property] ?? '[property_name]';
typedef MessageFromLocalizations = String? Function(AppLocalizations? _);

extension MessageFromLocalizationsX on MessageFromLocalizations {
  /// Use the [AppLocalizations].of(BuildContext) to translate it
  String translate(AppLocalizations _) => this.call(_)!;

  /// Workaround to deal with this closure compare
  int get overridedHash => this.call(null)!.hashCode;

  /// Returns [AppLocalizations] json property name
  String get compare => this.call(null)!;
}
