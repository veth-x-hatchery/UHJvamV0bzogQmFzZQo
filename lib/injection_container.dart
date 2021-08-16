import 'package:get_it/get_it.dart';
import 'package:vethx_beta/features/signin/sign_in_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  signInDependenciesInjection();
}
