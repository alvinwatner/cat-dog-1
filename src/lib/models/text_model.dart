
class TextState {
	final String text;

	TextState(this.text);

	Map<String, dynamic> toJson() {
		return {'text': text};
	}

	factory TextState.fromJson(Map<String, dynamic> json) {
		return TextState(json['text']);
	}
}
