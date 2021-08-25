import 'dart:async';

import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

class NavigationCubit {
  final _signInPageRoutesController =
      StreamController<SignInPageGoTo>.broadcast();

  void goTo(SignInPageGoTo parameters) {
    Logger.bloc('NavigationCubit -> goTo -> $parameters');
    _signInPageRoutesController.sink.add(parameters);
  }

  Stream<SignInPageGoTo> get stream => _signInPageRoutesController.stream;
}


// class NavigationCubit extends Cubit<NavigationState> {
//   NavigationCubit() : super(const NavigationState.initial());

//   void goTo(SignInPageGoTo parameters) {
//     Logger.bloc('NavigationCubit -> goTo -> $parameters');
//     emit(NavigationState.goTo(parameters));
//   }
// }
