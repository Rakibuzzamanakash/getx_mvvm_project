class AppExceptions implements Exception {

  // ignore: prefer_typing_uninitialized_variables
  final _massage;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppExceptions([this._massage,this._prefix]);

  @override
  String toString(){
    return '$_prefix,$_massage';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? massage]) : super (massage , 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? massage]) : super (massage , 'Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? massage]) : super (massage , 'Internal server error');
}