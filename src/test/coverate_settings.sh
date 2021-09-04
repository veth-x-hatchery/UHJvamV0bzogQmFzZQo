#!/bin/sh

# rm test/coverage_helper_test.dart
# file=test/coverage_helper_test.dart
# echo "// Helper file to make coverage work for all dart files\n" > $file
# echo "// ignore_for_file: unused_import" >> $file
# find lib -not -name '*.g.dart' \
# -and -not -name '*.freezed.dart' \
# -and -not -name '*_event.dart' \
# -and -not -name '*_state.dart' \
# -and -name '*.dart' \
# | cut -c4- | awk -v package=vethx_beta '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file
# echo "void main(){}" >> $file

no_pub=$1

default_flavor="--flavor=dev"
flutter_flavor="${2:-$default_flavor}"

rm -rf coverage/*
flutter test --coverage --suppress-analytics $no_pub $default_flavor
lcov --directory lib/features \
--remove coverage/lcov.info \
"lib/features/home/*" \
"lib/core/*" \
"lib/ui/*" \
"*service_locator.dart" \
"*failure.dart" \
"*_event.dart" \
"*.freezed.dart" \
"*_state.dart" \
"*mock.dart" \
-o coverage/new_lcov.info
genhtml coverage/new_lcov.info -o coverage/html