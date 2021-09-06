#!/bin/sh

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ WORKAROUND: MainActivity.local_auth ╞══════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

# see integration_tests.sh to understand
cp android/app/src/main/kotlin/com/vethx/hatchery/MainActivity.local_auth \
android/app/src/main/kotlin/com/vethx/hatchery/MainActivity.kt

ENV_APP_NAME="Hatchery"
ENV_APP_SUFFIX=".dev"

flutter_environment="""\
--dart-define=APP_ENVIRONMENT=test \
--dart-define=ENV_APP_NAME=$ENV_APP_NAME \
--dart-define=ENV_APP_SUFFIX=$ENV_APP_SUFFIX \
"""

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "APP_ENVIRONMENT: ${flutter_environment}"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

flutter run $flutter_environment