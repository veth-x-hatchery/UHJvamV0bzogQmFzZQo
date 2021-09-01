import 'package:vethx_beta/l10n/l10n.dart';

typedef MessageFromLocations = String? Function(AppLocalizations? _);

extension MessageFromLocationsX on MessageFromLocations {
  String? get(AppLocalizations? _) => this.call(_);
}
