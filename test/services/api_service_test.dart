import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/services/api_service.dart';

void main() {
  group('ApiService', () {
    test('page number should start at 0', () {
      expect(ApiService().page, 0);
    });

    test('has more should start as false', () {
      expect(ApiService().hasMore, false);
    });

    test('List should start as empty', () {
      expect(ApiService().finalDataList, []);
    });

    test('Final List is not empty', () {
      expect(ApiService().finalList().then((value) => value.length), isNot(0));
    });
  });
}
