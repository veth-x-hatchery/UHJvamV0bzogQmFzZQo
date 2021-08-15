import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/features/signin/sign_in_injection_container.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await signInDependenciesInjection(sl);
}
