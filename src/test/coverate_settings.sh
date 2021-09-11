#!/bin/sh

no_pub=$1

rm -rf coverage/*

flutter test --coverage --suppress-analytics $no_pub

lcov \
--directory lib/features \
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

genhtml coverage/new_lcov.info \
-o coverage/html