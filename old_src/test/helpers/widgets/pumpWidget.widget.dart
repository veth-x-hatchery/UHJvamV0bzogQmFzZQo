import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/l10n/l10n.dart';

Widget setupToPump(
  Widget child, {
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
}) {
  return MaterialApp(
    navigatorObservers: navigatorObservers,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: NavigationRoutes.onGenerateRoute,
    routes: NavigationRoutes.routes(),
    theme: ThemeData(primarySwatch: Colors.blue),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Builder(
      builder: (context) {
        SizeConfig().init(context);
        return child;
      },
    ),
  );
}

extension WidgetTesterBuildContext on WidgetTester {
  AppLocalizations get l10n => allStates
      .firstWhere((e) => AppLocalizations.of(e.context) != null)
      .context
      .l10n;
}
