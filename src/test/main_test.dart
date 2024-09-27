
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cat_dog_app/main.dart';

// Mock Cubit for testing
class MockTextCubit extends MockCubit<String> implements TextCubit {}

void main() {
	group('Main file tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('Displays HomeScreen when app is launched', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MyApp(),
				),
			);

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('Initial text is "Cat"', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn('Cat');

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
		});

		testWidgets('Toggle text button changes text to "Dog"', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn('Cat');

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pumpAndSettle();

			when(() => textCubit.state).thenReturn('Dog');
			textCubit.emit('Dog');

			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
		});
	});
}
