import 'package:flutter/material.dart';

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;
  const AppStateContainer({
    Key? key,
    required this.child,
    required this.blocProvider,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();

  /// This method looks up the tree and
  /// finds the closest parent inherited widget of that type
  ///
  /// So now, we have a method called of that gives us a reference to the InheritedWidget.appData
  /// property anywhere in the widget subtree...
  ///
  /// And the InheritedWidget.appData is just a state object!

  static AppState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_AppStoreContainer>())!
        .appData;
  }
}

class AppState extends State<AppStateContainer> {
  BlocProvider get blocProvider => widget.blocProvider;

  @override
  Widget build(BuildContext context) {
    return _AppStoreContainer(
      /// Passes itself
      /// in as the
      /// appData
      /// property

      appData: this,

      /// Remember that this "widget.child"
      /// child is passed in from the runApp method, and it
      /// represents the rest of the widget tree

      child: widget.child,
      blocProvider: widget.blocProvider,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _AppStoreContainer extends InheritedWidget {
  final AppState appData;
  final BlocProvider blocProvider;

  const _AppStoreContainer({
    Key? key,
    required Widget child,
    required this.appData,
    required this.blocProvider,
  }) : super(key: key, child: child);

  /// This method is called
  /// after rebuilds and always passes in the old widget as an argument
  @override
  bool updateShouldNotify(_AppStoreContainer oldWidget) =>
      oldWidget.appData != appData;
}

// class ServiceProvider {
//   final CatalogService catalogService;
//   final CartService cartService;

//   ServiceProvider({
//     @required this.catalogService,
//     @required this.cartService,
//   });
// }

class BlocProvider {
  // CartBloc cartBloc;
  // CatalogBloc catalogBloc;
  // UserBloc userBloc;

  // BlocProvider({
  //   @required this.cartBloc,
  //   @required this.catalogBloc,
  //   @required this.userBloc,
  // });
}
