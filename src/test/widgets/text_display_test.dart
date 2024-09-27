
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cat_dog_app/widgets/text_display.dart';

class MockTextCubit extends Mock implements TextCubit {}

void main() {
	group('TextDisplay Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		testWidgets('initially displays "Cat"', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: TextDisplay(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
		});

		testWidgets('toggles to "Dog" when tapped', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat'));
			when(() => textCubit.toggleText()).thenAnswer((_) {
				when(() => textCubit.state).thenReturn(TextState('Dog'));
			});

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: TextDisplay(),
					),
				),
			);

			await tester.tap(find.byType(TextDisplay));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
		});
	});
}
