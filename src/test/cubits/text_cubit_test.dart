
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_dog_app/cubits/text_cubit.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat"', () {
			expect(textCubit.state.text, 'Cat');
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog")] when toggleText is called once',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextState('Dog')],
		);

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog"), TextState(text: "Cat")] when toggleText is called twice',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [TextState('Dog'), TextState('Cat')],
		);
	});
}
