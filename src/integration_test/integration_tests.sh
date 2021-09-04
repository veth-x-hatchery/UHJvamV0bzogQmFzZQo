#!/bin/sh

default_flavor="--flavor=dev"

flutter_flavor="${1:-$default_flavor}"

echo "Flutter Flavor: ${flutter_flavor}"
echo ""

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ WORKAROUND: Expect to be executed from ./src/ ╞════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

cp android/app/src/main/kotlin/com/example/vethx_login/MainActivity.integration_tests \
android/app/src/main/kotlin/com/example/vethx_login/MainActivity.kt

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ SIGN IN REGISTER INTEGRATION TEST ╞════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

flutter drive \
--driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/features/signin/sign_in_register_integration_test.dart \
$flutter_flavor

echo ""
echo ""
echo ""
echo ""
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ SIGN IN WITH EMAIL INTEGRATION TEST ╞══════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

flutter drive \
--driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/features/signin/sign_in_email_integration_test.dart \
$flutter_flavor

echo ""
echo ""
echo ""
echo ""
echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ WORKAROUND ╞═══════════════════════════════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

cp android/app/src/main/kotlin/com/example/vethx_login/MainActivity.local_auth \
android/app/src/main/kotlin/com/example/vethx_login/MainActivity.kt