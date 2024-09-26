
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/text_model.dart';

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState('Cat'));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextState('Dog'));
		} else {
			emit(TextState('Cat'));
		}
	}
}

class TextState {
	final String text;
	TextState(this.text);
}
