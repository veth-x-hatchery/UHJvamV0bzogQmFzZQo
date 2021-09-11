// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoggingNavigationObserver extends RouteObserver<PageRoute<dynamic>> {
//   @override
//   void didPop(Route route, Route previousRoute) {
//     debugPrint("Navigation didPop: ${route?.settings?.name}");
//   }

//   @override
//   void didPush(Route route, Route previousRoute) {
//     debugPrint("Navigation didPush: ${route?.settings?.name}");
//   }

//   @override
//   void didRemove(Route route, Route previousRoute) {
//     debugPrint("Navigation didRemove: previousRoute:${previousRoute?.settings?.name},  route: ${route?.settings?.name}");
//   }

//   @override
//   void didReplace({Route newRoute, Route oldRoute}) {
//     debugPrint("Navigation didReplace: ${oldRoute?.settings?.name} with ${newRoute?.settings?.name}");
//   }
// }

// class ProviderLogger extends ProviderObserver {
//   @override
//   void didAddProvider(ProviderBase provider, Object value) {
//     _print("ProviderObserver => didAddProvider", provider);
//     super.didAddProvider(provider, value);
//   }

//   @override
//   void didDisposeProvider(ProviderBase provider) {
//     _print("ProviderObserver => didDisposeProvider", provider);
//     super.didDisposeProvider(provider);
//   }

//   @override
//   void didUpdateProvider(ProviderBase provider, Object newValue) {
//     _print("ProviderObserver => didUpdateProvider", provider, newValue: newValue);
//   }

//   void _print(String source, ProviderBase provider, {Object newValue}) {
//     //return print('''
//     // {
//     // "source": $source,
//     // "provider": "${provider.name ?? provider.runtimeType}",
//     // "newValue": "$newValue"
//     // }''');
//   }
// }
