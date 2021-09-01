import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/l10n/l10n.dart';

Builder setupToPump(
  Widget child, {
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
}) {
  return Builder(builder: (context) {
    SizeConfig().init(context);
    return MaterialApp(
      navigatorObservers: navigatorObservers,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoutes.onGenerateRoute,
      routes: NavigationRoutes.routes(),
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  });
}

extension WidgetTesterBuildContext on WidgetTester {
  AppLocalizations get l10n => allStates.first.context.l10n;
}
