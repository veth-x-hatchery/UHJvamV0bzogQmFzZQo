import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

/// Actualy this type, closure, has no hash based on function received body
/// This means that is not possible compare same values
/// [VethxNotification] has a workaround to deal with it
typedef MessageFromLocalizations = String? Function(AppLocalizations? _);

extension MessageFromLocalizationsX on MessageFromLocalizations {
  String? translate(AppLocalizations? _) => this.call(_);
}
