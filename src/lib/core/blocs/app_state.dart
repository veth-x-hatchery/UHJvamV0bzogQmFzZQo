// import 'package:flutter/material.dart';
// import 'package:hatchery/core/blocs/core_business_logic.dart';
// import 'package:hatchery/core/blocs/core_services.dart';

// class AppStateContainer extends StatefulWidget {
//   final Widget child;
//   final RootBLoCProvider blocProvider;
//   final ServiceProvider serviceProvider;

//   const AppStateContainer({
//     Key? key,
//     required this.child,
//     required this.blocProvider,
//     required this.serviceProvider,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => AppState();

//   /// This method looks up the tree and
//   /// finds the closest parent inherited widget of that type
//   ///
//   /// So now, we have a method called of that gives us a reference to the InheritedWidget.appData
//   /// property anywhere in the widget subtree...
//   ///
//   /// And the InheritedWidget.appData is just a state object!

//   static AppState of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType<_AppStoreContainer>())!
//         .appData;
//   }
// }

// class AppState extends State<AppStateContainer> {
//   RootBLoCProvider get blocProvider => widget.blocProvider;
//   ServiceProvider get serviceProvider => widget.serviceProvider;

//   @override
//   Widget build(BuildContext context) {
//     return _AppStoreContainer(
//       /// Passes itself
//       /// in as the
//       /// appData
//       /// property

//       appData: this,
//       blocProvider: blocProvider, serviceProvider: serviceProvider,

//       /// Remember that this "widget.child"
//       /// child is passed in from the runApp method, and it
//       /// represents the rest of the widget tree

//       child: widget.child,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

// class _AppStoreContainer extends InheritedWidget {
//   const _AppStoreContainer({
//     Key? key,
//     required Widget child,
//     required this.appData,
//     required this.blocProvider,
//     required this.serviceProvider,
//   }) : super(key: key, child: child);

//   final AppState appData;
//   final RootBLoCProvider blocProvider;
//   final ServiceProvider serviceProvider;

//   /// This method is called
//   /// after rebuilds and always passes in the old widget as an argument
//   @override
//   bool updateShouldNotify(_AppStoreContainer oldWidget) =>
//       oldWidget.appData != appData;
// }
