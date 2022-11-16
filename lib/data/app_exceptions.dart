class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error During communication');
}

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedExceptions extends AppExceptions {
  UnauthorisedExceptions([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, 'Invalid input');
}
