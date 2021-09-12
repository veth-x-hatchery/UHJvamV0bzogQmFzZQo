#!/bin/sh

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ WORKAROUND: MainActivity.local_auth ╞══════════════════════════════════════════════════"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

# see integration_tests.sh to understand
cp android/app/src/main/kotlin/com/vethx/hatchery/MainActivity.local_auth \
android/app/src/main/kotlin/com/vethx/hatchery/MainActivity.kt

HATCHERY_APP_NAME="Hatchery"
HATCHERY_APP_SUFFIX=".dev"
HATCHERY_GOOGLE_REVERSED_CLIENT_ID="com.googleusercontent.apps.124787010793-v3rjki082uci25sm92p5mrvpqlo8mtel"

flutter_environment="""\
--dart-define=HATCHERY_APP_ENVIRONMENT=dev \
--dart-define=HATCHERY_APP_NAME=$HATCHERY_APP_NAME \
--dart-define=HATCHERY_APP_SUFFIX=$HATCHERY_APP_SUFFIX \
--dart-define=HATCHERY_GOOGLE_REVERSED_CLIENT_ID=$HATCHERY_GOOGLE_REVERSED_CLIENT_ID \
"""

echo "═══════════════════════════════════════════════════════════════════════════════════════════"
echo "══╡ HATCHERY_APP_ENVIRONMENT: ${flutter_environment}"
echo "═══════════════════════════════════════════════════════════════════════════════════════════"

if [ $1 = 'run' ]; 
then
    flutter run $flutter_environment
elif [ $1 = 'build-android' ];
then
    flutter build apk --release $flutter_environment
elif [ $1 = 'build-ios' ];
then
    flutter build ios --release $flutter_environment
fi