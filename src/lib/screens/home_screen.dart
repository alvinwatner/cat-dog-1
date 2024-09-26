
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_dog_app/cubits/text_cubit.dart';
import 'package:cat_dog_app/widgets/text_display.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Cat Dog App'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						BlocBuilder<TextCubit, TextState>(
							builder: (context, state) {
								return TextDisplay(text: state.text);
							},
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								context.read<TextCubit>().toggleText();
							},
							child: Text('Toggle Text'),
						),
					],
				),
			),
		);
	}
}
