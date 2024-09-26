
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_dog_app/screens/home_screen.dart';
import 'package:cat_dog_app/cubits/text_cubit.dart';
import 'package:cat_dog_app/widgets/text_display.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('should display initial text as Cat', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byType(TextDisplay), findsOneWidget);
		});

		testWidgets('should display updated text as Dog when Cubit state changes', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([TextState('Cat'), TextState('Dog')]),
				initialState: TextState('Cat'),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.pump();
			expect(find.text('Cat'), findsOneWidget);

			await tester.pump();
			expect(find.text('Dog'), findsOneWidget);
		});

		testWidgets('should call toggleText when button is pressed', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat'));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			verify(() => textCubit.toggleText()).called(1);
		});
	});
}
