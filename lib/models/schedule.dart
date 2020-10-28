class Schedule {
  String _uidSched;
  String _imageUri;
  String _title;
  String _timeBegin;
  String _timeEnd;
  String _classRoom;
  int _assignment;

  Schedule(this._uidSched, this._imageUri, this._title, this._timeBegin,
      this._timeEnd, this._classRoom, this._assignment);

  // ignore: unnecessary_getters_setters
  int get assignment => _assignment;

  String get classRoom => _classRoom;

  String get timeEnd => _timeEnd;

  String get timeBegin => _timeBegin;

  String get title => _title;

  String get imageUri => _imageUri;

  String get uidSched => _uidSched;

  set uidSched(String value) {
    _uidSched = value;
  }

  Schedule.fromMap(Map<String, dynamic> map) {
    this._uidSched = map['uidSched'];
    this._imageUri = map['imageUri'];
    this._title = map['title'];
    this._timeBegin = map['timeBegin'];
    this._timeEnd = map['timeEnd'];
    this._classRoom = map['classRoom'];
    this._assignment = map['assignment'];
  }

  toMap() {
    return {
      'uidSched': _uidSched,
      'imageUri': _imageUri,
      'title': _title,
      'timeBegin': _timeBegin,
      'timeEnd': _timeEnd,
      'classRoom': _classRoom,
      'assignment': _assignment,
    };
  }

  set imageUri(String value) {
    _imageUri = value;
  }

  set assignment(int value) {
    _assignment = value;
  }

  set classRoom(String value) {
    _classRoom = value;
  }

  set timeEnd(String value) {
    _timeEnd = value;
  }

  set timeBegin(String value) {
    _timeBegin = value;
  }

  set title(String value) {
    _title = value;
  }
}
