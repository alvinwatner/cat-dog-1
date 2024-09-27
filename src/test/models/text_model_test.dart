
import 'package:flutter_test/flutter_test.dart';
import 'package:cat_dog_app/models/text_model.dart';

void main() {
	group('TextState Model Tests', () {
		test('should create TextState with initial text', () {
			final textState = TextState('Cat');
			expect(textState.text, equals('Cat'));
		});

		test('should correctly serialize TextState', () {
			final textState = TextState('Dog');
			final json = textState.toJson();
			expect(json, equals({'text': 'Dog'}));
		});

		test('should correctly deserialize TextState', () {
			final json = {'text': 'Cat'};
			final textState = TextState.fromJson(json);
			expect(textState.text, equals('Cat'));
		});
	});
}
