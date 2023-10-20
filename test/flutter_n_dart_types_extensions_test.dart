import 'package:flutter_n_dart_types_extensions/flutter_n_dart_types_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Test DateTime Extension',
    () {
      test('Test If Given Correct Month Full name is Given', () {
        DateTime date = DateTime(2023, 1, 31);

        expect(date.dateFormatter.monthFullName, equals('January'));
      });
    },
  );
}
