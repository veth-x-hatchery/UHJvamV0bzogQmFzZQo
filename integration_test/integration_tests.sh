#!/bin/sh

echo '═══════════════════════════════════════════════════════════════════════════════════════════'
echo '══╡ SIGN IN REGISTER INTEGRATION TEST ╞════════════════════════════════════════════════════'
echo '═══════════════════════════════════════════════════════════════════════════════════════════'
flutter drive --driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/features/signin/sign_in_register_integration_test.dart
echo ''
echo ''
echo ''
echo ''
echo '═══════════════════════════════════════════════════════════════════════════════════════════'
echo '══╡ SIGN IN WITH EMAIL INTEGRATION TEST ╞══════════════════════════════════════════════════'
echo '═══════════════════════════════════════════════════════════════════════════════════════════'
flutter drive --driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/features/signin/sign_in_email_integration_test.dart
echo ''
echo ''
echo ''
echo ''