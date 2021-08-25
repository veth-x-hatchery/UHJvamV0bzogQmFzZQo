import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'navigation_state.dart';

part 'navigation_cubit.freezed.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());

  void goTo(SignInPageGoTo parameters) {
    Logger.bloc('NavigationCubit -> goTo -> $parameters');
    emit(NavigationState.goTo(parameters));
  }
}
