import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker connectionChecker;
  late NetworkInfo networkInfo;

  setUp(() {
    connectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfo(connectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(connectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        final result = networkInfo.isConnected;
        // assert
        verify(connectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );

    test(
      'should return false in exeptions cases',
      () async {
        // arrange
        when(connectionChecker.hasConnection).thenThrow(Exception());
        // act
        final result = await networkInfo.isConnected;
        // assert
        verify(connectionChecker.hasConnection);
        expect(result, false);
      },
    );
  });
}
