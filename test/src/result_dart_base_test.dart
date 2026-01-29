import 'package:result_dart/result_dart.dart';
import 'package:test/test.dart';

void main() {
  test('result dart base ...', () {
    final result = const Success(0).pureFold(1, 's');

    expect(result, isA<Success<int, String>>());
    expect(result.getOrThrow(), 1);
  });
  group('getBoth', () {
    test('should return a record with success value and null error on Success',
        () {
      final result = Success<String, Exception>('success');
      final (:success, :failure) = result.getBoth();
      expect(success, 'success');
      expect(failure, isNull);
    });

    test('should return a record with null success and error value on Failure',
        () {
      final exception = Exception('failure');
      final result = Failure<String, Exception>(exception);
      final (:success, :failure) = result.getBoth();
      expect(success, isNull);
      expect(failure, exception);
    });
  });
}
