
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_dog_app/cubits/text_cubit.dart';

class TextDisplay extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () => context.read<TextCubit>().toggleText(),
			child: BlocBuilder<TextCubit, TextState>(
				builder: (context, state) {
					return Center(
						child: Text(
							state.text,
							style: TextStyle(fontSize: 24),
						),
					);
				},
			),
		);
	}
}
