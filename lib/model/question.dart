class Question {
  final int _id;
  final String _questionText;
  final String _imageUrl;
  final bool _answer;
  final int _point;
  Question(
      this._id, this._answer, this._point, this._imageUrl, this._questionText);

  int get id => _id;
  String get questionText => _questionText;
  String get imageUrl => _imageUrl;
  int get point => _point;
  bool get answer => _answer;
}
